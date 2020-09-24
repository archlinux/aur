# Original Contributor: Marcos Heredia <chelqo@gmail.com>
# Maintainer: Jakob Jungreithmeir <https://aur.archlinux.org/account/JakobJung>
# Last edited: 5th April 2017

_font="dosis"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.9
pkgrel=1
pkgdesc="Very simple, rounded, sans serif font family, from Pablo Impallari"
arch=(any)
url="https://github.com/impallari/Dosis"
license=('custom:OFL')
groups=("${_group}-fonts")
makedepends=('git')
depends=('fontconfig')
install=updatefont.install
source=("git+git://github.com/impallari/Dosis")
sha1sums=('SKIP')

package() {
  cd ${srcdir}/Dosis
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"

  cd fonts/v1007\ Fontlab\ -\ Original/TTF

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

}
