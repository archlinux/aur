# Maintainer: AntiCompositeNumber <anticompositenumber at gmail dot com>
pkgname=fresh-node
pkgver=21.09.1
pkgrel=1
pkgdesc="Wikimedia tool to create Docker containers for running isolated npm tests"
arch=('any')
url="https://gerrit.wikimedia.org/g/fresh"
license=('custom:0BSD')
depends=('docker' 'bash')
makedepends=('git')
checkdepends=()
optdepends=('podman')
source=("$pkgname-$pkgver::git+https://gerrit.wikimedia.org/r/fresh#tag=$pkgver")
sha256sums=('SKIP')

check() {
	cd "$pkgname-$pkgver"
	./test
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE-0BSD "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 bin/fresh-node10 "$pkgdir/usr/bin/fresh-node10"
    install -Dm755 bin/fresh-node12 "$pkgdir/usr/bin/fresh-node"
    install -Dm755 bin/fresh-node14 "$pkgdir/usr/bin/fresh-node14"
}
