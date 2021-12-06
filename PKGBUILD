# Maintainer: Michael Gisbers <michael@gisbers.de>
pkgname=flashprint
pkgver=5.2.0
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




md5sums=('9ee0800576c1e33081641d8d74724922'
         'e2a783e7d78b40b55432c00f38dacae8')
sha256sums=('ae2d8ad73ed16b95c6058b8ac40d62285bb5af093b3050492fd6411d70d13269'
            '65c17b8b726d779956e99a3df4d1e90435a194686370c589f71b09aeebddda5c')
sha512sums=('fafb8870b76a4ca911f89a9b06a5a73e7bfd3634238b0b244202a2bee9e2ac53a346e61025678a7a05724eb09aa1b808399bd0c213f52d057af9bca181180d69'
            'fc3364dfdce9d3558ceea74137343c4a7a2fe6231dfe02f3298cca03d055b7237d4397fe58171452cca962f842f93dc6116b0761e4d5ef3c54105b4203c66f9f')
