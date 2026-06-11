# Maintainer: Eun0us <eun0us@espilon.net>

pkgname=emon
pkgver=0.1.0
pkgrel=2
pkgdesc="Universal serial monitor for embedded devices"
arch=('x86_64')
url="https://github.com/EspilonOrg/emon"
license=('Apache-2.0')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/EspilonOrg/emon/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b5abea543f7970eb662228cd13fa533b6db9cfcef43348ff89424446f4253bcc')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make PREFIX="$pkgdir/usr" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
