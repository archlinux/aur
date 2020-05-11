# Maintainer: Cauê Baasch de Souza <cauebs@pm.me>
pkgname=durt
pkgver=0.6.0
pkgrel=1
pkgdesc="Command line tool for calculating the size of files and directories"
arch=('x86_64')
url="https://github.com/cauebs/$pkgname"
license=('GPL-3.0')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('82ee65054cb56f5c7ae80c0c4390299cdb4e5cd8f385356ef8c02b2ed186938a4061150e3b3bb543fa9e25431ea99ffce1c4617826424327dcb6f0f5a91556a0')

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
