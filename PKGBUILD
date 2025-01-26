# Maintainer: Nickid2018 <nickid2018@outlook.com>
_pkgname='MC_Dissector'
pkgname=wireshark-minecraft-dissector
pkgver=1.3.2
pkgrel=1
pkgdesc="Wireshark dissector for Minecraft protocols."
arch=('x86_64')
url="https://github.com/Nickid2018/MC_Dissector"
license=('GPL2')
depends=('wireshark-cli>=4.4.0' 'cjson')
makedepends=(cmake)
source=("https://github.com/Nickid2018/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c264395482151a2f205503e211cde4aff3410976a15d518c741f15624d744d55')

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
