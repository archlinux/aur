# Maintainer: j-james <jj@j-james.me>
pkgname=thesauromatic-git
_pkgname=thesauromatic
pkgver=v0.0.3.r27.gb5fdfd2
pkgrel=1
pkgdesc="A static, offline, command-line thesaurus."
arch=('any')
url="https://github.com/cjrh/thesauromatic"
license=('AGPL')
makedepends=('rust')
provides=('thesauromatic')
source=(git+"https://github.com/cjrh/$_pkgname")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'	
}

build() {
	cd "$_pkgname"
	cargo build --release
}

package() {
	cd "$_pkgname"
	install -Dm755 "target/release/thesauromatic" "$pkgdir/usr/bin/thesauromatic"
}
