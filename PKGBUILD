# Maintainer: pysio <me@lilithya.su>
pkgname=repoq
pkgver=0.2.1
pkgrel=1
pkgdesc="A lightweight command-line client for the Repology API"
arch=('x86_64' 'aarch64')
url="https://github.com/pysio2007/repoq"
license=('Apache-2.0')
depends=('curl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pysio2007/repoq/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('3be9855738d3f7496debc269f91dfc75704f32cb85c415570fab378f11778b25')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 repoq "$pkgdir/usr/bin/repoq"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 man/repoq.1 "$pkgdir/usr/share/man/man1/repoq.1"
}
