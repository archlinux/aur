# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

_name=auditok
pkgname=python-auditok
pkgver=0.2.0
pkgrel=1
pkgdesc="An audio/acoustic activity detection and audio segmentation tool."
arch=('any')
url="https://github.com/amsehili/auditok"
license=('MIT')
depends=("python")
optdepends=("python-pydub: read audio files in popular audio formats (ogg, mp3, etc.) or extract audio from a video file."
	"python-pyaudio: read audio data from the microphone and play back detections."
	"python-matplotlib: plot audio signal and detections"
	"python-numpy: used for math operations instead of standard python if available.")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('46c512e287b2e13df4819774166af32b236d754afbe6b0dc87281b233e5ae688')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
