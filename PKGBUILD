# Maintainer: Víctor Javier Díaz Garrido <vicdigar at hotmail dot com>
pkgname=novafetch-git
_pkgname=novafetch
pkgver=0.1.1
pkgrel=1
pkgdesc="Simple tool written in Rust to get information about your pc"
arch=('x86_64')
url="https://github.com/UnversedBlood/novafetch"
license=('GPL3')
depends=()
makedepends=('cargo' 'git' 'make')
provides=(novafetch)
conflicts=(novafetch)
source=("git+https://github.com/UnversedBlood/novafetch.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1)"
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	#make install
	install -D -m755 "target/release/novafetch" "$pkgdir/usr/bin/novafetch"
}
