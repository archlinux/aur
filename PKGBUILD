# Maintainer: Nils Czernia <nils[at]czserver[dot]de>

pkgname=winbox-beta
pkgver=3.3
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
sha256sums=('836dd05ab4daf0b25e7a07b020faee9cd85edfcf310f6012f83eadb706586148'
            '1744beb9b3746d28c1185ff6963bc1adfe908e9775672af28ca85aa500845865'
            '603eaed8dfb5b6146712c5cee801e6d77f1f45d6bd5c4b545f9f84193834d380'
            'dc95b5b3cf5ad5990711e0b85e2d59812d6c1fe51acaf8eba15eeba1f1cffe1e')

package() {
  install -Dm755 "${srcdir}/winbox.exe" "${pkgdir}/usr/share/winbox-beta/winbox-beta.exe"
  install -Dm755 "${srcdir}/winbox-beta" "${pkgdir}/usr/bin/winbox-beta"
  install -Dm655 "${srcdir}/winbox-beta.png" "${pkgdir}/usr/share/pixmaps/winbox-beta.png"
  install -Dm655 "${srcdir}/winbox-beta.desktop" "${pkgdir}/usr/share/applications/winbox-beta.desktop"
}

