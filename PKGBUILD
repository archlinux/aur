# Maintainer: Nickid2018 <nickid2018@outlook.com>
_pkgname='MC_Dissector'
pkgname=wireshark-minecraft-dissector
pkgver=1.3.5
pkgrel=1
pkgdesc="Wireshark dissector for Minecraft protocols."
arch=('x86_64')
url="https://github.com/Nickid2018/MC_Dissector"
license=('GPL2')
depends=('wireshark-cli>=4.4.0' 'cjson')
makedepends=(cmake)
source=("https://github.com/Nickid2018/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('19330fb8c80577b91abf45e1ac5e33199a8169ea107d0a947902b2d45334ac04')

build() {
    cmake -B build -S "$_pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr/lib' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
