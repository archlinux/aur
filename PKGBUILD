# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname=kcast
pkgver=0.3.1
pkgrel=1
pkgdesc='A KDE Plasma 6 widget that lets you cast video files or YouTube URLs to Chromecast devices in your local network'
arch=('x86_64')
url='https://github.com/Agundur-KDE/KCast'
license=('GPL-3.0-only')
depends=('avahi' 'catt' 'plasma-integration')
makedepends=('extra-cmake-modules' 'vulkan-headers')
source=("https://github.com/Agundur-KDE/KCast/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('d7c8855d44893159708a054716ef613a85c0b74e5837991102cac3f25ccbcc1a4360d2d693f77cb401b35d8c22cdb8665dd7fc9cb2979b9bb7619fee6907d284')

build() {
    cd KCast-"${pkgver}"

    cmake -B build -DCMAKE_BUILD_TYPE='Release'

    make -C build
}

package() {
    cd KCast-"${pkgver}"/build

    make DESTDIR="${pkgdir}" install
}
