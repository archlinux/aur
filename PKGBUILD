# Contributor: orumin <dev@orum.in>

pkgname=ttf-mikachan
pkgver=8.9
pkgrel=1
pkgdesc="Mikachan Japanese TrueType fonts for X."
arch=('any')
url="http://mikachan-font.com/"
license=('CUSTOM')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
_mirror="jaist"
source=(http://${_mirror}.dl.sourceforge.jp/mikachan/5513/mikachanfont-${pkgver}.tar.bz2)
md5sums=('8ac2b94336e76fa80996d0be70c557de')

package() {
    cd "${srcdir}"

    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -m644 "mikachanfont-${pkgver}"/fonts/*.ttf "${pkgdir}/usr/share/fonts/TTF"

    install -d "${pkgdir}/usr/share/licenses/custom/${pkgname}"
    install -m644 "mikachanfont-${pkgver}"/COPYRIGHT "${pkgdir}/usr/share/licenses/custom/${pkgname}/license.txt"
}
