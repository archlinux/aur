# Maintainer: capezotte (carana2099 ob gmail at com)

pkgname=blesh-git
_pkgname=ble.sh
pkgdesc="A replacement for bash's line editor with advanced features"
pkgver=r1486.0506df2
pkgrel=1
license=(BSD)
url='https://github.com/akinomyoga/ble.sh'
depends=(bash)
makedepends=(bash awk make)
arch=(any)
source=('git+https://github.com/akinomyoga/ble.sh.git')
md5sums=('SKIP')
install=blesh.install

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	git submodule init
}

package() {
	cd "$_pkgname"
	make install DESTDIR="$pkgdir" PREFIX=/usr
}
