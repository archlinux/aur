# Maintainer: vscncls <lucaslou4@protonmail.com>

pkgname=quich
pkgver=2.1
pkgrel=1
pkgdesc="Small, fast and useful calculator for your terminal with multiple functions and options."
url="https://github.com/Usbac/quich"
arch=('x86_64')
license=('MIT')
depends=()
makedepends=()
provides=("$pkgname")
conflicts=()
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('7105380d4350fc90027949629aeaa235')

build() {
    cd $pkgname-$pkgver
    NAME=$pkgname make quich
}

package() {
    install -Dm755 $pkgname-$pkgver/$pkgname $pkgdir/usr/bin/$pkgname

    install -Dm644 $pkgname-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname
}
