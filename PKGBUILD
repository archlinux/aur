# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=anydesk
pkgver=2.1.1
pkgrel=1
pkgdesc="'AnyDesk Free' is an All-In-One Software for Remote Support"
arch=('i686' 'x86_64')
url="http://anydesk.de/"
license=('custom:Freeware')
depends=('gtkglext')

source_i686=(http://download.anydesk.com/${pkgname}-${pkgver}-i686.tar.gz)
source_x86_64=(http://download.anydesk.com/${pkgname}-${pkgver}-amd64.tar.gz)

sha256sums_i686=('536e765ebaa9ccb4a2183d2289bfa0ba778692516f917d4441af0cd34f74ba71')
sha256sums_x86_64=('dfdb76fe4fe17a5da9c396306616249965de286286135a5bffb1407b9cc9272a')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p ${pkgdir}/usr/bin ${pkgdir}/usr/share/pixmaps/anydesk ${pkgdir}/usr/share/doc/anydesk
    chmod +rx anydesk
    mv anydesk ${pkgdir}/usr/bin
    mv icons/* ${pkgdir}/usr/share/pixmaps/anydesk
    rm -rf icons
    mv * ${pkgdir}/usr/share/doc/anydesk
}
