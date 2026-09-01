# Maintainer: pysio <me@lilithya.su>
pkgname=repoq
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight command-line client for the Repology API"
arch=('x86_64' 'aarch64')
url="https://github.com/pysio2007/repoq"
license=('Apache-2.0')
depends=('curl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pysio2007/repoq/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('634b477fcd5473ee6c1ff53e79a8170e51c108b7d36aa9dc2a8e7355a44ccd96')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 repoq "$pkgdir/usr/bin/repoq"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
