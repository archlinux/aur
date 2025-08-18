# Maintainer: Rubin Bhandari <roobin.bhandari@gmail.com>
pkgname=pokego-git
pkgrel=2
pkgver=r9.14b24758
pkgdesc="command-line tool that lets you display Pokémon sprites in color directly in your terminal."
arch=('x86_64' 'aarch64')
url="https://github.com/rubiin/pokego.git"
license=('GPL-3.0-or-later')
depends=()
makedepends=('git' 'go' 'coreutils')
conflicts=('pokego')
source=("$pkgname::git+$url")
md5sums=('SKIP')

build() {
	cd "$pkgname"
	go build -o pokego
}

package() {
	cd "$pkgname"
	install -Dm755 pokego "$pkgdir/usr/bin/pokego"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
