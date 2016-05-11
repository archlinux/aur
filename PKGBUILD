# Maintainer: Max Beck <rytonemail@gmail.com>
pkgname=wed-git
pkgver=v0.1.r18.7075355
pkgrel=1
pkgdesc="Wed is a terminal text editor with key bindings commonly used in Windows based editors"
arch=(any)
url="https://github.com/rgburke/wed"
license=('GPLv2')
depends=('ncurses' 'pcre' 'flex' 'bison' 'boost-libs' 'source-highlight')
makedepends=('git' 'ncurses' 'pcre' 'flex' 'bison' 'make' 'coreutils' 'boost' 'source-highlight')
provides=('wed-git')
conflicts=('wed-git')
source=("git://github.com/rgburke/wed.git")
md5sums=('SKIP')
pkgver() {
	cd wed
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}
build() {
	cd wed
	make PREFIX="/usr"
}
check() {
	cd wed
	make test
}
package() {
	cd wed
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
