# Maintainer: Alexander Bocken <alexander@bocken.org>

pkgname=ttf-inconsolata2
pkgver=2.000
pkgrel=1
pkgdesc="Inconsolata font. Ligature-free release compatible with Xft (dwm, dmenu, st, ...)"
arch=('any')
url="https://www.google.com/fonts/specimen/Inconsolata"
license=('custom:OFL')
conflicts=('ttf-inconsolata')
depends=()
source=("$pkgname-$pkgver.zip::https://github.com/googlefonts/Inconsolata/archive/refs/tags/v.$pkgver.zip"
        '75-ttf-inconsolata.conf')
sha256sums=('SKIP'
            'f29a1b45c96ee05e64c03181b587f48a5d090839b7356eb4f48fb752a17a899f')

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 "${srcdir}"/Inconsolata-v.$pkgver/fonts/ttf/*.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 "${srcdir}/Inconsolata-v.$pkgver/OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
  install -Dm644 "${srcdir}/Inconsolata-v.$pkgver/FONTLOG.txt" "${pkgdir}/usr/share/doc/${pkgname}/FONTLOG.txt"

  install -Dm644 "${srcdir}/75-ttf-inconsolata.conf" "${pkgdir}/usr/share/fontconfig/conf.avail/75-ttf-inconsolata.conf"
}
