# Maintainer:
# Contributor: Seba sebastian.zwierzchowski [AT] gmail [dot] com

_fontname="borders-divide"
_pkgname="ttf-$_fontname"
pkgname="$_pkgname"
pkgver=1.000
pkgrel=2
pkgdesc="TrueType Font: Borders Divide, But Hearts Shall Conquer"
url="https://www.dafont.com/borders-divide-but-hearts-shall-conquer.font"
license=('LicenseRef:Free-for-personal-use')
arch=('any')

source=(
  "$_fontname-$pkgver.zip"::"http://dl.dafont.com/dl/?f=borders_divide_but_hearts_shall_conquer"
  "License-20180523.txt" # https://www.creativefabrica.com/single-sales-license/
)
sha256sums=(
  '749d261353c133e271d10190d3992ffd1e066589987b0f5ea68efca0e6404a59'
  '02f8f4d9926cf439593605a765415aee2de65ca1d819501e76ab1cc025994ce9'
)

prepare() {
  for i in *" - TTF.ttf" ; do
    mv "$i" "${i% - TTF.ttf}.ttf"
  done
}

package() {
  install -Dm644 *.ttf -t "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 'License-20180523.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
