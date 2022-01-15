# Maintainer: seabassapologist <teamseabass@protonmail.com>
pkgname=gobbl
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple Go utility to get and display connected bluetooth device battery levels via the Bluez D-Bus interface"
arch=(x86_64)
url="https://github.com/seabassapologist/gobbl"
license=('BSD')
makedepends=('go>=1.17')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('296baab44b11647200c9245520970c0bbe685d4d38da683e7adaa71fc6111c71')

build() {
    cd "$pkgname-$pkgver"
    go build -v -o gobbl .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}
}
