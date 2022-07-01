# Maintainer: Gyara <laxect39@gmail.com>

pkgname=beancount-language-server
pkgver=1.2.5
pkgrel=1
pkgdesc="A Language Server Protocol (LSP) for beancount files"
arch=('any')
url="https://github.com/polarmutex/${pkgname}"
license=('MIT')
depends=('beancount')
makedepends=('cargo')
source=(https://github.com/polarmutex/${pkgname}/archive/v${pkgver//_/-}.tar.gz)
sha512sums=('a147bbbd0dc376e6d38017ab6d0edf5bae9dc8fcea2bcd2bf0d7679499a1975d30603337db2de240c5712d5f36bfbf01818ea8e9b337aab9a3408062b23a77c9')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo build --release --target-dir=target
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
