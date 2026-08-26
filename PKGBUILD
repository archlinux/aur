# Maintainer: Rubin Bhandari <roobin.bhandari@gmail.com>
pkgname=pokego-git
pkgrel=4
pkgver=0.5.6
pkgdesc="command-line tool that lets you display Pokémon sprites in color directly in your terminal."
arch=('x86_64' 'aarch64')
url="https://github.com/rubiin/pokego.git"
license=('GPL-3.0-or-later')
depends=()
makedepends=('git' 'go' 'coreutils')
conflicts=('pokego')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	go build -ldflags "-s -w" -o pokego
}

package() {
	cd "$pkgname"
	install -Dm755 pokego "$pkgdir/usr/bin/pokego"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
