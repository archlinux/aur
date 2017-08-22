# Maintainer: Romain Bazile <gromain d0t baz at gmail dot com>

pkgname=mcuxpresso-config-tools
pkgver=3.0.2
pkgrel=2
epoch=
pkgdesc="Integrated suite of configuration tools for NXP's microcontrollers. From RPM package distributed by NXP."
arch=('x86_64')
url="http://www.nxp.com/products/software-and-tools/run-time-software/mcuxpresso-software-and-tools/mcuxpresso-config-tools:MCUXpresso-Config-Tools"
license=('custom:"NXP"')
depends=('java-environment' 'libxslt' 'libxtst' 'gcc-libs-multilib' 'gtk2' 'alsa-lib' 'libnet')
source=("https://cache.nxp.com/secured/bsps/${pkgname}-v3-1.${arch}.rpm?__gda__=1503412477_d1e44dec7df2676f361c64b99dc67452&fileExt=.rpm" "LICENSE" "${pkgname}.install")

sha256sums=('34b6606d653355b88a1857e787e2d321a702936ba10da94d7c3dd97589fb9951'
            'a0130ae83f03b1faa62123719a937b86508e92b204015834410dfcb4c9dae559'
            '6435144e9b28ec594ebea3e598e01e23a4d41c3787a67de68dafedcf71bc18ed')

options=('!strip')

package() {
        cp -r ${srcdir}/usr ${pkgdir}/;
        cp -r ${srcdir}/opt ${pkgdir}/;
        install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE;
}
