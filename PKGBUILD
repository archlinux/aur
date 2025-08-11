# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname='kcast'
pkgver=0.2.1
pkgrel=1
pkgdesc='A KDE Plasma 6 widget that lets you cast video files or YouTube URLs to Chromecast devices in your local network'
arch=('x86_64')
url='https://github.com/Agundur-KDE/KCast'
license=('GPL-3.0-only')
depends=('avahi' 'catt' 'plasma-integration')
makedepends=('extra-cmake-modules' 'vulkan-headers')
source=("https://github.com/Agundur-KDE/KCast/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('51596982d807b8ffe79d997e8c1f26166f02695efa0e97d96da2f779a2e8166c79dff19944b874932f79c37700f67f692e1d275e1a509cf7b25214340eff48af')

build() {
    cd KCast-"${pkgver}"

    cmake .

    make .
}

package() {
    cd KCast-"${pkgver}"

    make DESTDIR="$pkgdir" install
}
