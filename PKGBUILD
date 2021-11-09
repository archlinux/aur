# Maintainer: Cauê Baasch de Souza <cauebs@pm.me>
pkgname=durt
pkgver=1.0.3
pkgrel=1
pkgdesc="Command line tool for calculating the size of files and directories"
provides=('durt')
arch=('x86_64')
url="https://github.com/cauebs/$pkgname"
license=('GPL-3.0')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('63edefc9e6f954013b61dd8b0cd79686272a9510a7aa6dae09c3287f7dc45e817bfeb490b7ebb4847e32282b6c1237e892bac27cbff28a8e3fced7c8d296f55a')

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
