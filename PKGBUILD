# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname=kcast
pkgver=0.2.14
pkgrel=1
pkgdesc='A KDE Plasma 6 widget that lets you cast video files or YouTube URLs to Chromecast devices in your local network'
arch=('x86_64')
url='https://github.com/Agundur-KDE/KCast'
license=('GPL-3.0-only')
depends=('avahi' 'catt' 'plasma-integration')
makedepends=('extra-cmake-modules' 'vulkan-headers')
source=("https://github.com/Agundur-KDE/KCast/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('e492932b43551192ec77723b39c2728a669b0120100ec522b1315e1ec75a213c1dd80b58aaaa3bf9e76debb95a1c9a868ad47e86bb8022c0079f2574764841a7')

build() {
    cd KCast-"${pkgver}"

    cmake -B build -DCMAKE_BUILD_TYPE='Release'

    make -C build
}

package() {
    cd KCast-"${pkgver}"/build

    make DESTDIR="${pkgdir}" install
}
