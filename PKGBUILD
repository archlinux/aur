# Maintainer: Johann Gründl <mail@johanngruendl.at>

pkgname=ttf-adobe-source-fonts
_relver_sans=3.006R
_relver_serif=3.001R
_relver_code=2.030R-ro/1.050R-it
pkgver=${_relver_sans//[\-\/]/+}+${_relver_serif//[\-\/]/+}+${_relver_code//[\-\/]/+}
_sans=source-sans-pro
_serif=source-serif-pro
_code=source-code-pro
_tarname_sans=${_sans}-${_relver_sans//\//-}
_tarname_serif=${_serif}-${_relver_serif//\//-}
_tarname_code=${_code}-${_relver_code//\//-}
pkgrel=3
pkgdesc="TTF versions of Adobe's Source fonts (includes non-variable versions of Source Sans Pro, Source Serif Pro, and Source 
Code Pro)."
url="https://github.com/adobe-fonts"
arch=(any)
license=(custom)
source=("$_tarname_sans.tar.gz::https://github.com/adobe-fonts/$_sans/archive/$_relver_sans.tar.gz"
"$_tarname_serif.tar.gz::https://github.com/adobe-fonts/$_serif/archive/$_relver_serif.tar.gz"
"$_tarname_code.tar.gz::https://github.com/adobe-fonts/$_code/archive/$_relver_code.tar.gz"
)
sha256sums=('a384e8c3246490bb5eaf79eb9eb9e41d7f2d167bb7d36280156ec77ae8ddfda1'
'84e08c9e870081e0fcda4d83b02e06a4a7f35e52f96491a2246eca8b82fc8a53'
'a4e4dd59b8e0a436b934f0f612c2e91b5932910c6d1c3b7d1a5a9f389c86302b')

package() {
  cd ./$_tarname_sans
  install -d "$pkgdir/usr/share/fonts/${pkgname}"
  install -t "$pkgdir/usr/share/fonts/${pkgname}" -m644 TTF/*.ttf
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE-sans"
  cd ../$_tarname_serif
  install -d "$pkgdir/usr/share/fonts/${pkgname}"
  install -t "$pkgdir/usr/share/fonts/${pkgname}" -m644 TTF/*.ttf
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE-serif"
  cd ../$_tarname_code
  install -d "$pkgdir/usr/share/fonts/${pkgname}"
  install -t "$pkgdir/usr/share/fonts/${pkgname}" -m644 TTF/*.ttf
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-code"
}
