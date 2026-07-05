# Maintainer: quinsaiz <edgood228@gmail.com>

pkgname=ppd-cpu-boost
pkgver=1.1.0
pkgrel=1
pkgdesc="Systemd service to synchronize CPU Turbo Boost state with power-profiles-daemon."
arch=('any')
url="https://github.com/quinsaiz/ppd-cpu-boost"
license=('GPL-3.0-or-later')
depends=('python' 'python-gobject' 'power-profiles-daemon')

install="${pkgname}.install"

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quinsaiz/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")

sha256sums=('8f71316a3c639f04f8b701e8f949cc9a9df74e949d23ff79247b029b1526b2b6')

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 ppd-cpu-boost         "${pkgdir}/usr/bin/ppd-cpu-boost"
    install -Dm644 ppd-cpu-boost.service "${pkgdir}/usr/lib/systemd/system/ppd-cpu-boost.service"
}

