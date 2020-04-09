
# Maintainer: Pixel Light <evan@tatarka.me>
pkgname=ponysay-rust-git
_pkgname=ponysay
pkgver=v0.1+0
pkgrel=1
pkgdesc="Bare-bones implementation of ponysay in rust"
arch=("any")
url="https://github.com/evant/ponysay-rust"
license=("GPL3" "FDL")
depends=()
makedepends=('rust')
provides=('ponysay')
conflicts=('ponysay')
source=("$_pkgname::git+https://github.com/evant/ponysay-rust.git")
md5sums=("SKIP")

pkgver() {
	cd "$_pkgname"
	echo "$(git describe --long | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/+/' )"
}

build() {
	cd "$_pkgname"
	make PREFIX="/usr"
}

check() {
	cd "$_pkgname"
	make check
}

package() {
	cd "$_pkgname"
	make install PREFIX="/usr" DESTDIR="$pkgdir"
}

