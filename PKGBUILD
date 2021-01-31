# Maintainer: Johann Gründl <mail@johanngruendl.at>

pkgname=ttf-adobe-source-fonts
_relver_sans3=3.028R
_relver_sanspro=3.006R
_relver_serif4=4.004R
_relver_serifpro=3.001R
_relver_code=2.038R-ro/1.058R-it/1.018R-VAR
pkgver=${_relver_sans3//[\-\/]/+}+${_relver_serif4//[\-\/]/+}+${_relver_code//[\-\/]/+}
_sans=source-sans-pro
_serif=source-serif
_code=source-code-pro
_tarname_sans3=${_sans}-${_relver_sans3//\//-}
_tarname_sanspro=${_sans}-${_relver_sanspro//\//-}
_tarname_serif4=${_serif}-${_relver_serif4//\//-}
_tarname_serifpro=${_serif}-${_relver_serifpro//\//-}
_tarname_code=${_code}-${_relver_code//\//-}
pkgrel=6
pkgdesc="TTF versions of Adobe's Source fonts (includes variable and non-variable versions of Source Sans 3, Source Serif 4, and Source 
Code Pro). Also includes the latest versions under old names (Source Sans Pro, 3.006R; Source Serif Pro, 3.001R)."
url="https://github.com/adobe-fonts"
arch=(any)
license=(custom)
conflicts=('ttf-sourcesanspro')
provides=('ttf-sourcesanspro')
source=(
"$_tarname_sans3.tar.gz::https://github.com/adobe-fonts/$_sans/archive/$_relver_sans3.tar.gz"
"$_tarname_sanspro.tar.gz::https://github.com/adobe-fonts/$_sans/archive/$_relver_sanspro.tar.gz"
"$_tarname_serif4.tar.gz::https://github.com/adobe-fonts/$_serif/archive/$_relver_serif4.tar.gz"
"$_tarname_serifpro.tar.gz::https://github.com/adobe-fonts/$_serif/archive/$_relver_serifpro.tar.gz"
"$_tarname_code.tar.gz::https://github.com/adobe-fonts/$_code/archive/$_relver_code.tar.gz"
)
sha256sums=(
'12faf267e40f1be46daf44afce47facd6efb996e2f2f5abe0a3dde161d54e251'
'a384e8c3246490bb5eaf79eb9eb9e41d7f2d167bb7d36280156ec77ae8ddfda1'
'dfb364735699cb830caad534cf7741234804d28e4b6fc5e4736b2401f6131aba'
'6be29a6ecc275d39f77d608fba576ee1976287f65823bde61309dc907023410c'
'd8f879fefd66ecb7291ea2d73984b9c0a97fb499424e58290ba6b81787d0c725'
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
  cd ../$_tarname_serif4
  install -d "$pkgdir/usr/share/fonts/${pkgname}"
  install -t "$pkgdir/usr/share/fonts/${pkgname}" -m644 TTF/*.ttf
  install -t "$pkgdir/usr/share/fonts/${pkgname}" -m644 VAR/*.ttf
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE-serif"
  cd ../$_tarname_serifpro
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
