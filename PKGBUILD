# Maintainer: Eun0us <eun0us@espilon.net>

pkgname=emon
pkgver=0.1.1
pkgrel=1
pkgdesc="Universal serial monitor for embedded devices"
arch=('x86_64')
url="https://github.com/EspilonOrg/emon"
license=('Apache-2.0')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/EspilonOrg/emon/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f1ae820b4ecd3122e82c497ea3ba1852a2f336b79ffaa545d6912a435fcf96a9')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make PREFIX="$pkgdir/usr" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
