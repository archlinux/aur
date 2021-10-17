# Maintainer: Ernest C. Suarez <ernestcsuarez@gmail.com>
pkgname=hyperpad
pkgver=0.60
pkgrel=1
pkgdesc="A fast, simple and open-source text editor"
arch=('x86_64')
url="https://github.com/ecsuarez/hyperpad"
license=('GPL')
depends=('qt5-base')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ecsuarez/hyperpad/archive/v$pkgver.tar.gz")
md5sums=('8d3b67ec1434b8596d1b7b67e2fdb32b')

build() {
    cd "$pkgname-$pkgver"
    mkdir build && cd build
    cmake ..
    cmake --build .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "build/src/$pkgname" "${pkgdir}/usr/bin/$pkgname"
    install -Dm644 data/$pkgname.desktop "${pkgdir}/usr/share/applications/$pkgname.desktop"
    install -Dm644 data/icons/hyper_ico.png "${pkgdir}/usr/share/pixmaps/$pkgname.png"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/doc/$pkgname/LICENSE"
}
