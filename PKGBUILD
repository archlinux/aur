# Maintainer: Zhang Hai <dreaming.in.code.zh@gmail.com>

pkgname=tp-battery-mode
pkgver=1.1
pkgrel=1
pkgdesc="Module to manage the battery mode (lifetime/runtime) of your Thinkpad"
url="https://github.com/DreaminginCodeZH/tp-battery-mode"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('tpacpi-bat')
source=(https://github.com/DreaminginCodeZH/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('dc8779f63b3493ee32be72625c9f1cb0b50869c6f78ec8691e41bb4da96b98dda19617bc217bfe59091797e1dca7a11c7f55ba15ebee25ddb9de6f9522aa5044')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.conf" "${pkgdir}/etc/${pkgname}.conf"
    install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
