# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname=kcast
pkgver=0.5.0
pkgrel=1
pkgdesc='A KDE Plasma 6 widget that lets you cast video files or YouTube URLs to Chromecast devices in your local network'
arch=('x86_64')
url='https://github.com/Agundur-KDE/KCast'
license=('GPL-3.0-only')
depends=('avahi' 'catt' 'plasma-integration')
makedepends=('extra-cmake-modules' 'vulkan-headers')
source=("https://github.com/Agundur-KDE/KCast/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('d392e4bc40d16abd63534c984331ae716dc4ef858be2ffbe154616dba437460b20e96b0cf5558dea2171b66dd2eaa19402b8ffe9bb68d45aeccb5106059510e6')

build() {
    cd KCast-"${pkgver}"

    cmake -B build -DCMAKE_BUILD_TYPE='Release'

    make -C build
}

package() {
    cd KCast-"${pkgver}"/build

    make DESTDIR="${pkgdir}" install
}
