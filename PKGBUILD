# Maintainer: Romain Bazile <gromain d0t baz at gmail dot com>

pkgname=kinetis-expert-configuration-tools
pkgver=2
pkgrel=1
epoch=
pkgdesc="Integrated suite of configuration tools for NXP's microcontrollers. From RPM package distributed by NXP."
arch=('x86_64')
url="http://www.nxp.com/products/software-and-tools/hardware-development-tools/freedom-development-boards/software-development-kit-for-kinetis-mcus:KINETIS-SDK"
license=('custom:"NXP"')
depends=('java-environment')
source=("https://cache.nxp.com/secured/KDS/Kinetis_Expert_Configuration_Tools_v${pkgver}-${pkgrel}.${arch}_offline_b161010.rpm?__gda__=1493899506_49403d1881c089a209ac327fc73698dd&fileExt=.rpm" "LICENSE" "${pkgname}.install")
sha1sums=('adf924bcf482b926decf29f05241be26e7f379b7'
          '93deb1322e1de4c835cee5f18ce1547b3e1c3ce6'
          'f5eb1ce42d50fce84f86e3e8d309b7e621743549')

options=('!strip')

package() {
        cp -r ${srcdir}/usr ${pkgdir}/;
        cp -r ${srcdir}/opt ${pkgdir}/;
        install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE;
}
