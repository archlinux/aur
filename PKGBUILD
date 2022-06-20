# Maintainer: Gyara <laxect39@gmail.com>

pkgname=beancount-language-server
pkgver=1.1.2
pkgrel=1
pkgdesc="A Language Server Protocol (LSP) for beancount files"
arch=('any')
url="https://github.com/polarmutex/${pkgname}"
license=('MIT')
depends=('beancount')
makedepends=('cargo')
source=(https://github.com/polarmutex/${pkgname}/archive/beancount-language-server-v${pkgver//_/-}.tar.gz)
sha512sums=('06e43302baaf0f93dd10c4f005a61b076fb7358a1713df1b4641b8af4b2616279e3316a60811279a6e4e8fc46e03c9fb80420305cc16d24c93a2fc47e7b25a8f')

build() {
    cd "${srcdir}/${pkgname}-${pkgname}-v${pkgver}"
    cargo build --release --target-dir=target
}

package() {
    cd "${srcdir}/${pkgname}-${pkgname}-v${pkgver}"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
