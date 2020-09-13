# Maintainer: Michael Gisbers <michael@gisbers.de>
pkgname=flashprint
pkgver=4.4.0
pkgrel=1
pkgdesc="Slicer for the FlashForge 3D printers."
arch=('x86_64')
url="http://www.ff3dp.com/"
depends=('qt5-base')
license=('custom')
source=("${pkgname}-${pkgver}_amd64.deb::http://www.ishare3d.com/3dapp/public/FlashPrint-ii/FlashPrint/flashprint_${pkgver}_amd64.deb" "${pkgname}")


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




md5sums=('129388fd339b7a8eaed22d6164847472'
         '13f4219e9727314e9646f0230e736242')
sha256sums=('dc6b993a70b69df46fd4855529d68687e7575070a1aaa7e4a61801e83662edc0'
            '8d37f047b9e72f7eee1e7c21dd3eef6fb8b9d7fba94ef3b7c430fa7f6f5e89b3')
sha512sums=('0334399d1d3437c7bfecd14a62718ade006ca5fb466dbed87f2d11e98d643cb8e04031a843775837ef89583d91c34307253fe2a306cea57e64dc757c87417d2a'
            '1c44983c5761fe89970beb971783c8beb118ad744570cf6a1f3b7e12184b976011eccfd7539977006181ecd09a10a571ac810f4b8920be48453d8d2847f94c36')
