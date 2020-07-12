# Maintainer: Jesse Luehrs <archlinux@tozt.net>
pkgname=godwrap
pkgver=0.0.2
pkgrel=2
makedepends=('go')
arch=('i686' 'x86_64')
url="https://github.com/antifuchs/${pkgname}"
source=(https://github.com/antifuchs/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('3ad0f22d60d178a57460a6d860b8b4ffc360b24b6543127159015a0717196cd4')
pkgdesc="a cronwrapper implementation that ties into influxdb"
license=('MIT')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm 755 godwrap -t "${pkgdir}/usr/bin"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 755 -d "${pkgdir}/var/lib/godwrap"
}
