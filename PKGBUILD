
# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=swirc-git
_pkgname=swirc
pkgver=v2.1.r4.02b6457
pkgrel=1
pkgdesc="IRC client written with the Ncurses UI framework"
arch=('x86_64')
url="https://www.nifty-networks.net/swirc/"
license=('GPL')
depends=('curl' 'ncurses' 'openssl')
makedepends=('git' "pkg-config")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://github.com/uhlin/swirc.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

}

build() {
	cd "$srcdir/${_pkgname}"
	
	./configure
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	PREFIX=/usr make DESTDIR="$pkgdir/" install

}

