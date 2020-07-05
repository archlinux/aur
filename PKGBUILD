# Maintainer: Cauê Baasch de Souza <cauebs@pm.me>
pkgname=durt
pkgver=0.7.0
pkgrel=1
pkgdesc="Command line tool for calculating the size of files and directories"
arch=('x86_64')
url="https://github.com/cauebs/$pkgname"
license=('GPL-3.0')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a91b920fbd2bebe6de2515d2e1630fee533c8dd53be52be01cdd8275926f14da7ab62d0d572730f2636c49d8223b4b4e107c27cd93be463c43a0c1ea20bb6904')

build() {
    cd $pkgname-$pkgver
    cargo build --release --locked
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/${pkgname}"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}"
}
