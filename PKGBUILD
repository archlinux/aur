# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname=kcast
pkgver=0.2.6
pkgrel=1
pkgdesc='A KDE Plasma 6 widget that lets you cast video files or YouTube URLs to Chromecast devices in your local network'
arch=('x86_64')
url='https://github.com/Agundur-KDE/KCast'
license=('GPL-3.0-only')
depends=('avahi' 'catt' 'plasma-integration')
makedepends=('extra-cmake-modules' 'vulkan-headers')
source=("https://github.com/Agundur-KDE/KCast/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('19171520b5c9078feeaa97c03ebfbb791ae8384e69b1d6a7926cde3b625a4d6d0248b69678fd45ce975c190fde915c1333d66c59d31e06e2d1bb96d378ff4a68')

build() {
    cd KCast-"${pkgver}"

    cmake -B build -DCMAKE_BUILD_TYPE='Release' .

    make .
}

package() {
    cd KCast-"${pkgver}"/build

    make DESTDIR="$pkgdir" install
}
