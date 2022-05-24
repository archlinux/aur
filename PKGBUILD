# Maintainer: Alexander Bocken <alexander@bocken.org>

pkgname=ttf-inconsolata2
pkgver=2.012
pkgrel=1
pkgdesc="Monospace font. Last release compatible with Xft (dwm, dmenu, st, ...)"
arch=('any')
url="https://www.google.com/fonts/specimen/Inconsolata"
license=('custom:OFL')
conflicts=('ttf-inconsolata')
depends=()
source=("$pkgname-$pkgver.zip::https://github.com/googlefonts/Inconsolata/archive/refs/tags/v$pkgver.zip"
        '75-ttf-inconsolata.conf')
sha256sums=('58f04258291886edebcf95685e6a72ba34352b716b65fbc026265c66d9d80516'
            'f29a1b45c96ee05e64c03181b587f48a5d090839b7356eb4f48fb752a17a899f')

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 "${srcdir}"/Inconsolata-$pkgver/fonts/ttf/*.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 "${srcdir}/75-ttf-inconsolata.conf" "${pkgdir}/usr/share/fontconfig/conf.avail/75-ttf-inconsolata.conf"
}
