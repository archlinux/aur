# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=anydesk
pkgver=2.0.1
pkgrel=3
pkgdesc="'AnyDesk Free' is an All-In-One Software for Remote Support"
arch=('i686' 'x86_64')
url="http://anydesk.de/"
license=('custom:Freeware')

source_i686=(http://download.anydesk.com/${pkgname}-${pkgver}-i686.tar.gz)
source_x86_64=(http://download.anydesk.com/${pkgname}-${pkgver}-amd64.tar.gz)

sha256sums_i686=('2084ee36c1d8e10d828ad6343c0065fb22a21a576f7998c45053d90d061c4360')
sha256sums_x86_64=('79739de737a0736580317f7ce8c310fe6bd5067fd22af3969dddd2c7695e9061')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ls -alh
    mkdir -p ${pkgdir}/usr/bin ${pkgdir}/usr/share/pixmaps/anydesk ${pkgdir}/usr/share/doc/anydesk
    chmod +x anydesk
    mv anydesk ${pkgdir}/usr/bin
    mv icons/* ${pkgdir}/usr/share/pixmaps/anydesk
    rm -rf icons
    mv * ${pkgdir}/usr/share/doc/anydesk
}
