# Maintainer: Nils Czernia <nils[at]czserver[dot]de

pkgname=winbox-beta
pkgver=3.0rc16
pkgrel=1
pkgdesc="Configuration tool for MikroTik RouterOS (wine)" 
url="http://www.mikrotik.com"
arch=('x86_64' 'i686')
license=('custom')
depends=('wine')
optdepends=(
  'ttf-ms-fonts: for better fonts'
)
install=${pkgname}.install
source=("http://download2.mikrotik.com/routeros/winbox/${pkgver}/winbox.exe"
	"http://www.mikrotik.com/downloadterms.html"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}")
md5sums=('f15fcf255b97fde14120a3b6ed0fd25b'
         'd034563c27be7e75c6920f308f2d9f85'
         'd1b1fc11e54078239756bbf53b10524a'
         '1147544d4bd5ed8181c0eee5fcd31356'
         'f151701beaea7bb702e400ffb844f560')

package() {
  install -Dm755 "${srcdir}/winbox.exe" "${pkgdir}/usr/share/winbox-beta/winbox-beta.exe"
  install -Dm755 "${srcdir}/winbox-beta" "${pkgdir}/usr/bin/winbox-beta"
  install -Dm655 "${srcdir}/winbox-beta.png" "${pkgdir}/usr/share/pixmaps/winbox-beta.png"
  install -Dm655 "${srcdir}/winbox-beta.desktop" "${pkgdir}/usr/share/applications/winbox-beta.desktop"
  install -Dm644 "${srcdir}/downloadterms.html" "${pkgdir}/usr/share/licenses/winbox-beta/license.html"
}

