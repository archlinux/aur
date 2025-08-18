# Maintainer: Rubin Bhandari <roobin.bhandari@gmail.com>
pkgname=pokego-git
pkgrel=1
pkgver=r9.14b23757
pkgdesc="command-line tool that lets you display Pokémon sprites in color directly in your terminal."
arch=('x86_64' 'aarch64')
url="https://github.com/rubiin/pokego.git"
license=('GPL-3.0-or-later')
depends=()
makedepends=('git' 'go' 'coreutils')
conflicts=('pokego')
source=("$pkgname::git+$url")
md5sums=('SKIP')

# pkgver() {
# 	git -C "${pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
# }

build() {
	cd "$pkgname"
	go build -o pokego
}

package() {
	cd "$pkgname"
	install -Dm755 pokego "$pkgdir/usr/bin/pokego"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
