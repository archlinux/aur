# Maintainer: Luclu7 <luclu7@luclu7.fr>

_pkgsrcname=signwriting_2010_fonts
_pkgmaintainer=Slevinski
_pkgdestdirname=sw2010
pkgver=3.0.2
pkgrel=1
pkgdesc="SignWriting 2010 is a typeface for written sign languages which makes the entire International SignWriting Alphabet 2010 symbol set available in TrueType fonts."
pkgname=ttf-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('SIL Open Font License 1.1')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/${_pkgmaintainer}/${_pkgsrcname}/tar.gz/v${pkgver}")
sha256sums=('SKIP')
install=$pkgname.install

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}/"
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 "fonts/SignWriting 2010 Filling.ttf" "$pkgdir/usr/share/fonts/TTF/SignWriting 2010 Filling.ttf"
  install -m644 "fonts/SignWriting 2010.ttf" "$pkgdir/usr/share/fonts/TTF/SignWriting 2010.ttf"
  install -m644 "fonts/SuttonSignWriting.ttf" "$pkgdir/usr/share/fonts/TTF/SuttonSignWriting.ttf"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

