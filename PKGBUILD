# Maintainer: Víctor Javier Díaz Garrido <vicdigar at hotmail dot com>
pkgname=novafetch-git
_pkgname=novafetch
pkgver=0.1.0
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

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	#make install
	install -D -m755 "target/release/novafetch" "$pkgdir/usr/bin/novafetch"
}
