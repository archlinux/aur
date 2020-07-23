# Maintainer: Wesley Moore <wes@wezm.net>
# Maintainer: Bao Trinh <aur@qubidt.com>

# requires that you already have a full copy of this font

pkgname=ttf-pragmatapro
pkgver=0.828
pkgrel=2
pkgdesc="PragmataPro by Fabrizio Schiavi"
arch=('any')
url="http://www.fsd.it/shop/fonts/pragmatapro/"
license=('http://www.fsd.it/fonts/eula.htm')
source=("LICENSE")
sha256sums=('8067e67a5d2153a8990ffc866de319a01d21f6021789812dd1a38219062e1475')

package() {
  files=(
    "PragmataProB_0828.ttf"
    "PragmataProB_liga_0828.ttf"
    "PragmataProI_0828.ttf"
    "PragmataProI_liga_0828.ttf"
    "PragmataPro_Mono_B_0828.ttf"
    "PragmataPro_Mono_B_liga_0828.ttf"
    "PragmataPro_Mono_I_0828.ttf"
    "PragmataPro_Mono_I_liga_0828.ttf"
    "PragmataPro_Mono_R_0828.ttf"
    "PragmataPro_Mono_R_liga_0828.ttf"
    "PragmataPro_Mono_Z_0828.ttf"
    "PragmataPro_Mono_Z_liga_0828.ttf"
    "PragmataProR_0828.ttf"
    "PragmataProR_liga_0828.ttf"
    "PragmataProZ_0828.ttf"
    "PragmataProZ_liga_0828.ttf"
  )

  for i in "${files[@]}"
  do
    if [[ ! -f $i ]]; then
      error "You need a full copy of this font in order to install it"
      error "place all ttf files in src"
      error "${i} not found"
      return 1
    else
      msg "Found ${i}"
    fi
  done
  msg "Found all files, installing..."

  install -d "$pkgdir/usr/share/fonts/TTF/"
  for i in "${files[@]}"
  do
    install -m644 "$i" "$pkgdir/usr/share/fonts/TTF/"
  done
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
