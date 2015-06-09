# Maintainer: Tom Hetmer <tom.hetmer / outlook.cz>
# Maintainer: Daniel Milde <daniel / milde.cz>

pkgname=winbox
pkgver=2.2.18
pkgrel=5
pkgdesc="Mikrotik RouterOS GUI Configurator (wine)"
url="http://www.mikrotik.com"
arch=('x86_64' 'i686')
license=('custom')
depends=('wine')
optdepends=(
  'ttf-ms-fonts: for better fonts'
)
install=${pkgname}.install
source=("http://download2.mikrotik.com/${pkgname}.exe"
	"http://www.mikrotik.com/downloadterms.html"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}")
md5sums=('a63bb3a7ba06ee55c06a8315c2cfa066'
         'd034563c27be7e75c6920f308f2d9f85'
         'ea6bbb9b138ad71dbcdbeb84298f02eb'
         '1147544d4bd5ed8181c0eee5fcd31356'
         'b28167d4aada519014ff57b086292690')

package() {
  install -Dm755 "${srcdir}/${pkgname}.exe" "${pkgdir}/usr/share/${pkgname}/${pkgname}.exe"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm655 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm655 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/downloadterms.html" "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
}
