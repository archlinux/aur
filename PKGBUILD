# Maintainer: Victor Golovanenko <drygdryg2014 at yandex dot com>

pkgname=wpspin
pkgver=0.5.1
pkgrel=2
pkgdesc="WPS PIN generator"
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/drygdryg/wpspin-nim"
license=('MIT')
makedepends=('nim>=0.20.0' 'nimble' 'git')
provides=('wpspin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/drygdryg/wpspin-nim/archive/${pkgver}.tar.gz")
md5sums=('f6a763e0c71d583a822103f2f7aa1058')

build() {
    cd "wpspin-nim-${pkgver}"
    make -s
}

package() {
    cd "wpspin-nim-${pkgver}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    make DESTDIR=${pkgdir} install
}
