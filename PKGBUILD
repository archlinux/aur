name=ultimatevocalremovergui
pkgname=${name}-git
pkgver=5.6
pkgrel=1
pkgdesc="This application uses state-of-the-art source separation models to remove vocals from audio files. UVR's core developers trained all of the models provided in this package (except for the Demucs v3 and v4 4-stem models)."
arch=('any')
url=https://github.com/Anjok07/ultimatevocalremovergui
license=('custom:MIT License')
depends=('python-onnx2pytorch' 'python-soundfile' 'python-numpy' 'python-numpy' 'python-ml-collections' 'python-matchering' 'python-natsort' 'python-llvmlite' 'python-scipy' 'python-pytorch' 'python-wget' 'python-librosa' 'python-kthread' 'python-samplerate' 'python-urllib3' 'python-screeninfo' 'python-yaml' 'python-pyperclip' 'python-playsound' 'python-cryptography' 'python-diffq' 'python-audioread' 'python-certifi' 'python-einops' 'python-pydub' 'python-psutil' 'python-pyglet' 'python-omegaconf' 'python-pillow' 'python-julius-git' 'python-future' 'python-altgraph' 'python-opencv' 'python-pytorch-lightning' 'python-resampy' 'python-onnxruntime' 'soundtouch')
makedepends=('git')
source=("${name}::git+https://github.com/Anjok07/ultimatevocalremovergui.git"
	"UVR.sh"
	"UVR.diff")
sha256sums=("SKIP"
	"SKIP"
	"SKIP")

prepare() {
  cd "${srcdir}/${name}"
  git apply ../UVR.diff
}


package() {
  install -d "${pkgdir}/opt/${name}"
  chown -R $USER:$USER "${pkgdir}/opt/${name}"
  cp -r "${srcdir}/${name}/." "${pkgdir}/opt/${name}"
  chown -R $USER:$USER "${pkgdir}/opt/${name}"
  install -Dm755 "${srcdir}/UVR.sh" "${pkgdir}/usr/bin/UVR"
}
