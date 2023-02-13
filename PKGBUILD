# Maintainer: Michael Gisbers <michael@gisbers.de>
pkgname=flashprint
pkgver=5.6.0
pkgrel=1
pkgdesc="Slicer for the FlashForge 3D printers."
arch=('x86_64')
url="http://www.ff3dp.com/"
depends=('qt5-base')
license=('custom')
#source=("${pkgname}-${pkgver}_amd64.deb::http://www.ishare3d.com/3dapp/public/FlashPrint-ii/FlashPrint/flashprint_${pkgver}_amd64.deb" "${pkgname}")
source=("${pkgname}-${pkgver}_amd64.deb::http://www.ishare3d.com/3dapp/public/FlashPrint-5/FlashPrint/${pkgname}5_${pkgver}_amd64.deb" "${pkgname}")

package() {
    cd ${pkgdir}
    tar -Jxvf ${srcdir}/data.tar.xz
    install -d ${pkgdir}/usr/bin
#    ln -s ../share/FlashPrint/FlashPrint ${pkgdir}/usr/bin/flashprint
    # workaround for render issues
    install ${srcdir}/flashprint ${pkgdir}/usr/bin/flashprint
    # patch desktop file, workaround for render issues
    sed -i "/^Exec=/ c Exec=/usr/bin/flashprint" ${pkgdir}/usr/share/applications/FlashPrint5.desktop
}




md5sums=('9b465a12d047ad4d2a3ed7dbd39339f9'
         'e2a783e7d78b40b55432c00f38dacae8')
sha256sums=('983592719e819835a060c9e4e82bf9338f587b913a96a54aa23309ce69d61de5'
            '65c17b8b726d779956e99a3df4d1e90435a194686370c589f71b09aeebddda5c')
sha512sums=('10b5644268481088cd988f872eca34d10590094eef3d39dc3bd07138bc8015e0467a2506da4c1d38ce8e0629b6659fa8903598fef2baa24b0df2a043aa100b92'
            'fc3364dfdce9d3558ceea74137343c4a7a2fe6231dfe02f3298cca03d055b7237d4397fe58171452cca962f842f93dc6116b0761e4d5ef3c54105b4203c66f9f')
