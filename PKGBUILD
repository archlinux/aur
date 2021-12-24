
pkgname=python-pyaudio-skeh-git
pkgver=r124.f749f2187e232217f8ac112a1226b3af11f008e3
pkgrel=1
pkgdesc='Python audio library. Fixed version.'
arch=('any')
url='https://git.skeh.site/skeh/pyaudio'
license=()
depends=('python')
makedepends=('python-setuptools')
conflicts=('python-pyaudio')
provides=('python-pyaudio')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd $srcdir/pyaudio
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse HEAD)"
}

check() {
  cd $srcdir/pyaudio
  python3 setup.py check
}

package() {
  cd $srcdir/pyaudio
  python setup.py install --root="$pkgdir/" --optimize=1
}
