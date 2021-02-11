# Maintainer: Luclu7 <me at luclu7 dot fr>
pkgname=what-anime-cli-git
pkgver=1
pkgrel=1
pkgdesc="Find the anime scene by image using your terminal"
arch=('x86_64')
url="https://github.com/irevenko/what-anime-cli"
license=('MIT')
makedepends=('go')
source=("git+https://github.com/irevenko/what-anime-cli.git")
sha512sums=('SKIP')

warn_build_references() {
    : # I like __FILE__ and don't consider build references to be a problem
}

build() {
	cd "what-anime-cli"
	go build
}

package() {
	cd "what-anime-cli"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 what-anime-cli "$pkgdir/usr/bin/what-anime"
}
