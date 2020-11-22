# Maintainer: Johann Gründl <mail@johanngruendl.at>

pkgname=ttf-adobe-source-fonts
_relver_sans3=3.028R
_relver_sanspro=3.006R
_relver_serif=3.001R
_relver_code=2.032R-ro/1.052R-it/1.012R-VAR
pkgver=${_relver_sans3//[\-\/]/+}+${_relver_serif//[\-\/]/+}+${_relver_code//[\-\/]/+}
_sans=source-sans-pro
_serif=source-serif-pro
_code=source-code-pro
_tarname_sans3=${_sans}-${_relver_sans3//\//-}
_tarname_sanspro=${_sans}-${_relver_sanspro//\//-}
_tarname_serif=${_serif}-${_relver_serif//\//-}
_tarname_code=${_code}-${_relver_code//\//-}
pkgrel=5
pkgdesc="TTF versions of Adobe's Source fonts (includes variable and non-variable versions of Source Sans Pro, Source Serif Pro, and Source 
Code Pro). Now includes Source Sans Pro (3.006R) and Source Sans 3 (3.028R)."
url="https://github.com/adobe-fonts"
arch=(any)
license=(custom)
conflicts=('ttf-sourcesanspro')
provides=('ttf-sourcesanspro')
source=(
"$_tarname_sans3.tar.gz::https://github.com/adobe-fonts/$_sans/archive/$_relver_sans3.tar.gz"
"$_tarname_sanspro.tar.gz::https://github.com/adobe-fonts/$_sans/archive/$_relver_sanspro.tar.gz"
"$_tarname_serif.tar.gz::https://github.com/adobe-fonts/$_serif/archive/$_relver_serif.tar.gz"
"$_tarname_code.tar.gz::https://github.com/adobe-fonts/$_code/archive/$_relver_code.tar.gz"
)
sha256sums=(
'12faf267e40f1be46daf44afce47facd6efb996e2f2f5abe0a3dde161d54e251'
'a384e8c3246490bb5eaf79eb9eb9e41d7f2d167bb7d36280156ec77ae8ddfda1'
'84e08c9e870081e0fcda4d83b02e06a4a7f35e52f96491a2246eca8b82fc8a53'
'4e21492169b9efdd8c40ed6c34aa0d5e58d2a8724d0cd98f2e0f88ccf5ecc78c'
)

package() {
  cd ./$_tarname_sans3
  install -d "$pkgdir/usr/share/fonts/${pkgname}"
  install -t "$pkgdir/usr/share/fonts/${pkgname}" -m644 TTF/*.ttf
  install -t "$pkgdir/usr/share/fonts/${pkgname}" -m644 VAR/*.ttf
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE-sans3"
  cd ../$_tarname_sanspro
  install -d "$pkgdir/usr/share/fonts/${pkgname}"
  install -t "$pkgdir/usr/share/fonts/${pkgname}" -m644 TTF/*.ttf
  install -t "$pkgdir/usr/share/fonts/${pkgname}" -m644 VAR/*.ttf
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE-sans-pro"
  cd ../$_tarname_serif
  install -d "$pkgdir/usr/share/fonts/${pkgname}"
  install -t "$pkgdir/usr/share/fonts/${pkgname}" -m644 TTF/*.ttf
  install -t "$pkgdir/usr/share/fonts/${pkgname}" -m644 VAR/*.ttf
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE-serif"
  cd ../$_tarname_code
  install -d "$pkgdir/usr/share/fonts/${pkgname}"
  install -t "$pkgdir/usr/share/fonts/${pkgname}" -m644 TTF/*.ttf
  install -t "$pkgdir/usr/share/fonts/${pkgname}" -m644 VAR/*.ttf
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE-code"
}
