# Maintainer: TheCyberArcher <TheCyberArcher@protonmail.ch>
# Contributor: PumpkinCheshire <sollyonzou@gmail.com>

_name=auditok
pkgname=python-auditok
pkgver=0.3.0
pkgrel=1
pkgdesc="An audio/acoustic activity detection and audio segmentation tool."
arch=('any')
url="https://github.com/amsehili/auditok"
license=('MIT')
depends=("python" "python-pyaudio" "python-matplotlib" )
optdepends=("python-pydub: read audio files in popular audio formats (ogg, mp3, etc.) or extract audio from a video file."
	"python-numpy: used for math operations instead of standard python if available.")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('8565d6e7dfbecb7dbbe5c54fb5af66f8c1c827e06745c19df0e3fa468d0022a1')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
