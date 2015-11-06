# Maintainer: Matthew McClatchey <write[at]matthewmcclatchey[dot]com>

pkgname=winbox-beta
pkgver=3.0
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
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}")
md5sums=('7a72d69c27657f660b8b6a4af1473158'
         'd1b1fc11e54078239756bbf53b10524a'
         '1147544d4bd5ed8181c0eee5fcd31356'
         'f151701beaea7bb702e400ffb844f560')

package() {
  install -Dm755 "${srcdir}/winbox.exe" "${pkgdir}/usr/share/winbox-beta/winbox-beta.exe"
  install -Dm755 "${srcdir}/winbox-beta" "${pkgdir}/usr/bin/winbox-beta"
  install -Dm655 "${srcdir}/winbox-beta.png" "${pkgdir}/usr/share/pixmaps/winbox-beta.png"
  install -Dm655 "${srcdir}/winbox-beta.desktop" "${pkgdir}/usr/share/applications/winbox-beta.desktop"
}

