# Maintainer: Marwan Hawari <marwan.hawari@gmail.com>
pkgname=stew
pkgver=0.3.0
pkgrel=1
pkgdesc="An independent package manager for compiled binaries"
arch=('any')
url="https://github.com/marwanhawari/stew"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('722a117a82cee93d610eee81144badcbf663570dd4a23a8211486c095837812a')

build() {
    cd "$pkgname-$pkgver"
    go build -mod vendor -o "$pkgname" .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
