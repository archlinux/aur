# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname=kcast
pkgver=0.4.3
pkgrel=1
pkgdesc='A KDE Plasma 6 widget that lets you cast video files or YouTube URLs to Chromecast devices in your local network'
arch=('x86_64')
url='https://github.com/Agundur-KDE/KCast'
license=('GPL-3.0-only')
depends=('avahi' 'catt' 'plasma-integration')
makedepends=('extra-cmake-modules' 'vulkan-headers')
source=("https://github.com/Agundur-KDE/KCast/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('5cd5c8e7e5beff671081d13812e7bf68bbaba528b12397ddd61efe28cfd3b541491fb240211fbbcfe689a83591409146b13c6e67f4fb493763e91c692f235bc7')

build() {
    cd KCast-"${pkgver}"

    cmake -B build -DCMAKE_BUILD_TYPE='Release'

    make -C build
}

package() {
    cd KCast-"${pkgver}"/build

    make DESTDIR="${pkgdir}" install
}
