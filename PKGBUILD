# Maintainer: Artur Paiva <dr.hoome@gmail.com>
pkgname='cpuface-git'
pkgver=1496920823
pkgrel=1
pkgdesc="A simple CPU Governor and Monitor for Unix Systems written in Python and Qt"
arch=('i686' 'x86_64')
url="https://github.com/h0m3/cpuface"
license=('GPL3')
groups=()
depends=('python>=3.0.0' 'python-pyqt5>=5.8.0' 'pyqt5-common>=5.8.0')
optdepends=('intel-ucode: support for intel pstate')
makedepends=('git')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=('cpuface-git::git+https://github.com/h0m3/cpuface')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "%s" "$(git show -s --format=%ct)"
}

build() {
	cd "$srcdir/${pkgname%-VCS}"
	make
}

package() {
	cd "$srcdir/${pkgname%-VCS}"
	make DESTDIR="$pkgdir" install
}
