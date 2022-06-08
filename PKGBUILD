# Maintainer: MnJ (minionjim13 at gmail dot com)
# Contributor: Konstantin Gizdov <arch@kge.pw>

pkgname=(tensorflow_datasets)
pkgver='4.6.0'
pkgrel=1
url="https://github.com/tensorflow/datasets"
pkgdesc="A collection of datasets ready to use with TensorFlow"
depends=('absl-py'
         'python-attrs'
         'python-dill'
         'python-future'
         'python-numpy'
         'python-promise'
         'python-protobuf'
         'python-requests'
         'python-six'
         'tensorflow_metadata'
         'python-termcolor'
         'python-tqdm')
makedepends=('python-pip'
             'python-wheel')
optdepends=('python-beautifulsoup4: wsc273'
            'python-pycocotools: youtube_vis'
            'python-h5py: robonet'
            'python-imagecodecs: eurosat'
            'python-langdetect: c4'
            'python-librosa: nsynth'
            'python-lxml: wsc273'
            'python-matplotlib: cats_vs_dogs'
            'python-mwparserfromhell: wikipedia'
            'python-networkx: ogbg_molpcba'
            'python-nltk: c4'
            'python-opencv: imagenet2012_corrupted'
            'python-pandas: ogbg_molpcba, pet_finder'
            'python-pillow: colorectal_histology, wider_face'
            'python-pydub: common_voice, groove, gtzan, librispeech'
            'python-scikit-image: eurosat, imagenet2012_corrupted'
            'python-scikit-learn: nsynth'
            'python-scipy: aflw2k3d, duke_ultrasound, imagenet2012_corrupted, svhn, the300w_lp'
            'python-tifffile: eurosat'
            'python-tldextract: c4')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/05/ae/b6efc66bf6276265d813e12a895b05bc3533092d107ca57c8ecbf4c7c963/${pkgname}-${pkgver}-py3-none-any.whl")
sha256sums=('fc1f163668d449cb2280dedc458c25875aa92b665889a394dbd3dcff45978bfa')

package() {
  cd "${srcdir}"
  install -Dm644 "${pkgname}-${pkgver}.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  pip install "${pkgname}-${pkgver}-py3-none-any.whl" --root="${pkgdir}" --no-deps --ignore-installed --no-warn-script-location
}
