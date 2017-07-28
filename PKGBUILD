# Maintainer: Michael Gisbers <michael@gisbers.de>
pkgname=flashprint
pkgver=3.18.0
pkgrel=1
pkgdesc="Slicer for the FlashForge 3D printers."
### no i686 link for version 3.16.0 available
#arch=('i686' 'x86_64')
arch=('x86_64')
url="http://www.ff3dp.com/"
depends=('qt5-base')
source=("${pkgname}-${pkgver}_amd64.deb::http://www.ishare3d.com/3dapp/public/FlashPrint-ii/flashprint_${pkgver}_amd64.deb" "flashprint")
#source_i686=("${pkgname}-${pkgver}_i686.deb::http://www.sz3dp.com/upfile/2017/01/03/20170103151329_822.deb" "flashprint")


package() {
    cd ${pkgdir}
    tar -Jxvf ${srcdir}/data.tar.xz
    install -d ${pkgdir}/usr/bin
#    ln -s ../share/FlashPrint/FlashPrint ${pkgdir}/usr/bin/flashprint
    # workaround for render issues
    install ${srcdir}/flashprint ${pkgdir}/usr/bin/flashprint
    # patch desktop file, workaround for render issues
    sed -i "/^Exec=/ c Exec=/usr/bin/flashprint" ${pkgdir}/usr/share/applications/FlashPrint.desktop
}

md5sums=('7c9936a8c1aad7216074439eadaf633f'
         '1fa4e9abedbfb0fe9744986e2725d443')
sha256sums=('47b0e17d8d5f2b8a4e69e764b0782a81d04a7d0eb8530858e076007d870a3f7a'
            'c981bd5d01b885ee952331f60a5545f1e667055f2c1fd0a37d9bb1d227bc281a')
sha512sums=('76aced60659a8144e837d6ed0bd2b238586e9fe567fa84661653969d020d1b284501ab3fbfaad640f46f72738e1d07637b7400461d1b1bc1d2a12025bf94676e'
            'e233d1f4eac6b69ecb43bbd2a7a18ded87896109d1e20b7e41cae76377bd16901fd8defa7d89225a958f2d80aa44de52d8a6533619a2fc237aaae056d971fe0f')
