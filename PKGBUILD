# Maintainer: Michael Gisbers <michael@gisbers.de>
pkgname=flashprint
pkgver=5.8.6
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




md5sums=('bcf61d55d015f88477d7fb80dc850e53'
         'e2a783e7d78b40b55432c00f38dacae8')
sha256sums=('a22fe711d3a385b61ff48666a697ca8849a53465dd73dd3b2d2db1f2351c93e3'
            '65c17b8b726d779956e99a3df4d1e90435a194686370c589f71b09aeebddda5c')
sha512sums=('3afefa68f364454be3d3d78b2530939a3f577475995ef63defc09b385118bdbfdd4b1ee5928b2282c8213a7ad1176166a43aec65ee182a61d4d6afb08daac56f'
            'fc3364dfdce9d3558ceea74137343c4a7a2fe6231dfe02f3298cca03d055b7237d4397fe58171452cca962f842f93dc6116b0761e4d5ef3c54105b4203c66f9f')
