# Maintainer: Victor Golovanenko <drygdryg2014 at yandex dot com>

pkgname=wpspin
pkgver=0.3.0
pkgrel=1
pkgdesc="WPS PIN generator"
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/drygdryg/wpspin-nim"
license=('MIT')
makedepends=('nim>=0.20.0' 'nimble')
provides=('wpspin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/drygdryg/wpspin-nim/archive/${pkgver}.tar.gz")
md5sums=('ffcda6cffad621b5819f979e47df1cd8')

build() {
    cd "wpspin-nim-${pkgver}"
    make -s
}

package() {
    cd "wpspin-nim-${pkgver}"
    make DESTDIR=${pkgdir} install
}
