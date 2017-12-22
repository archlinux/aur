# Maintainer: Romain Bazile <gromain d0t baz at gmail dot com>

pkgname=mcuxpresso-config-tools
pkgver=4.0
pkgrel=1
epoch=
pkgdesc="Integrated suite of configuration tools for NXP's microcontrollers. From RPM package distributed by NXP."
arch=('x86_64')
url="http://www.nxp.com/products/software-and-tools/run-time-software/mcuxpresso-software-and-tools/mcuxpresso-config-tools:MCUXpresso-Config-Tools"
license=('custom:"NXP"')
depends=('java-environment' 'libxslt' 'libxtst' 'gcc-libs-multilib' 'gtk2' 'alsa-lib' 'libnet')
source=("https://cache.nxp.com/secured/bsps/MCUXPRESSO-CT-LIN64-DEB-PACKAGE.deb?__gda__=1513963386_fced790445e5032ee18287bd6a735b96&fileExt=.deb" "LICENSE" "${pkgname}.install")

sha256sums=('8207a51700e20186c7fe5a793398cd53e305f02392346599fffe78f8f3e5e833'
            'a0130ae83f03b1faa62123719a937b86508e92b204015834410dfcb4c9dae559'
            '6435144e9b28ec594ebea3e598e01e23a4d41c3787a67de68dafedcf71bc18ed')

options=('!strip')

prepare() {
        cd ${srcdir}/
        bsdtar -x -f data.tar.gz
}

package() {
        cp -r ${srcdir}/usr ${pkgdir}/;
        cp -r ${srcdir}/opt ${pkgdir}/;
        install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE;
}
