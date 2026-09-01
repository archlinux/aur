# Maintainer: pysio <me@lilithya.su>
pkgname=repoq
pkgver=0.1.2
pkgrel=1
pkgdesc="A lightweight command-line client for the Repology API"
arch=('x86_64' 'aarch64')
url="https://github.com/pysio2007/repoq"
license=('Apache-2.0')
depends=('curl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pysio2007/repoq/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e3d948506526818cad3300a4f65bc690a80e316de49ecb490e639b096e6c3b3b')

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
