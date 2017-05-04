# Maintainer: Romain Bazile <gromain d0t baz at gmail dot com>

pkgname=mcuxpresso-config-tools
pkgver=3
pkgrel=1
epoch=
pkgdesc="Integrated suite of configuration tools for NXP's microcontrollers. From RPM package distributed by NXP."
arch=('x86_64')
url="http://www.nxp.com/products/software-and-tools/run-time-software/mcuxpresso-software-and-tools/mcuxpresso-config-tools:MCUXpresso-Config-Tools"
license=('custom:"NXP"')
depends=('java-environment')
source=("https://cache.nxp.com/secured/bsps/${pkgname}-v${pkgver}-${pkgrel}.${arch}.rpm?__gda__=1493897484_0b005c36ff770e538f2ef14ca80e2d68&fileExt=.rpm" "LICENSE" "${pkgname}.install")
sha1sums=('b3e7a994652a5d5d69fc70e686c527b7fbb9ee03'
          '93deb1322e1de4c835cee5f18ce1547b3e1c3ce6'
          'd14fba003fb4142f0824257c36855ce5a80eaa22')

options=('!strip')

package() {
        cp -r ${srcdir}/usr ${pkgdir}/;
        cp -r ${srcdir}/opt ${pkgdir}/;
        install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE;
}
