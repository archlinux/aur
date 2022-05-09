# Maintainer: Gyara <laxect39@gmail.com>

pkgname=beancount-language-server
pkgver=1.1.1
pkgrel=1
pkgdesc="A Language Server Protocol (LSP) for beancount files"
arch=('any')
url="https://github.com/polarmutex/${pkgname}"
license=('MIT')
depends=('beancount')
makedepends=('cargo')
source=(https://github.com/polarmutex/${pkgname}/archive/v${pkgver//_/-}.tar.gz)
sha512sums=('3b0aa1a66274f53f2b08b8aa841306a53bca7105043b4b22f4b4b126605abff1c76b440c4251e6fb7351aa201a21c64616abd42e743f7c5a7d6b723cb6c08356')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo build --release --target-dir=target
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
