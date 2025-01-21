# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor:  Marwan Hawari <marwan.hawari@gmail.com>

pkgname=stew
pkgver=0.5.0
pkgrel=1
pkgdesc="An independent package manager for compiled binaries"
arch=('any')
url="https://github.com/marwanhawari/stew"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('420cb697cccc8ba7ea99a9aeb5299850c1114f5f5b718a2bb56cb5f37376f730')

build() {
    cd "$pkgname-$pkgver"

    go build -mod vendor -o "$pkgname" .
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "SECURITY.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
    install -Dm644 "CONTRIBUTING.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
    install -Dm644 "CODE_OF_CONDUCT.md" "${pkgdir}/usr/share/doc/${pkgname}/CODE_OF_CONDUCT.md"
}
