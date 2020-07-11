# Maintainer: Jesse Luehrs <archlinux@tozt.net>
pkgname=godwrap
pkgver=0.0.1
pkgrel=1
makedepends=('go')
arch=('i686' 'x86_64')
url="https://github.com/antifuchs/${pkgname}"
source=(https://github.com/antifuchs/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('8385a969a5a98b50eb1ef967dd75174085b3faa848f436131b81d349b2acf2bb')
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
}
