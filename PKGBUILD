# Maintainer: Michael Gisbers <michael@gisbers.de>
pkgname=flashprint
pkgver=5.3.4
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




md5sums=('c3a3f901b11a5fd431e5a6420f80b9b1'
         'e2a783e7d78b40b55432c00f38dacae8')
sha256sums=('f65f0fe3cd1148f2b900a3e729d2787cc1a7844423bf38e20d0362370db697b7'
            '65c17b8b726d779956e99a3df4d1e90435a194686370c589f71b09aeebddda5c')
sha512sums=('1428b4ee82c4052af2f22cc83d05388568a2034233e6d661152811d6ed5dbd53fe827bd5521b68e69d310904cf10fbe3e473d7eb06750bd61c41916b85f4c903'
            'fc3364dfdce9d3558ceea74137343c4a7a2fe6231dfe02f3298cca03d055b7237d4397fe58171452cca962f842f93dc6116b0761e4d5ef3c54105b4203c66f9f')
