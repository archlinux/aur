# Maintainer: dakataca <danieldakataca@gmail.com>
# Contributor: Cristophero <cristophero.alvarado@gmail.com>
pkgname=pseint
pkgver=20210609
pkgrel=1
pkgdesc="Educational tool to learn the fundamentals and development of programming logic"
arch=('x86_64')
url='http://pseint.sourceforge.net'
license=('GPL2')
conflicts=('pseint-bin')
depends=('libpng12' 'glu' 'gendesk')
noextract=(creator.psz)
source=(https://razaoinfo.dl.sourceforge.net/project/pseint/${pkgver}/pseint-l64-${pkgver}.tgz)
sha256sums=('a5df4e147c529e3da509b30dee02791642c32cb3b5bbbc6cd3cd7594f10cb9f4')  # 'makepkg -g' para generarlo.

package () {

    mkdir -p ${pkgdir}/opt/
    cp -r ${srcdir}/${pkgname}/ ${pkgdir}/opt/

    gendesk -n -f --exec='pseint %u' ../PKGBUILD
    install -Dm755 "../${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}/imgs/icon.icns" "${pkgdir}/usr/share/pixmaps/${pkgname}.icns"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
