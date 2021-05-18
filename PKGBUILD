# Maintainer: Wesley Moore <wes@wezm.net>
# Maintainer: Bao Trinh <aur@qubidt.com>

# requires that you already have a full copy of this font

pkgname=ttf-pragmatapro
pkgver=0.829
pkgrel=1
pkgdesc="PragmataPro by Fabrizio Schiavi"
arch=('any')
url="http://www.fsd.it/shop/fonts/pragmatapro/"
license=('http://www.fsd.it/fonts/eula.htm')
source=("LICENSE")
sha256sums=('71a14f207ca21d1ce2b168ce974341e54792e99036599af4582530b1277441f6')

package() {
  files=(
    "PragmataPro_Mono_B_0829.ttf"
    "PragmataPro_Mono_B_liga_0829.ttf"
    "PragmataPro_Mono_I_0829.ttf"
    "PragmataPro_Mono_I_liga_0829.ttf"
    "PragmataPro_Mono_R_0829.ttf"
    "PragmataPro_Mono_R_liga_0829.ttf"
    "PragmataPro_Mono_Z_0829.ttf"
    "PragmataPro_Mono_Z_liga_0829.ttf"
    "PragmataProB_0829.ttf"
    "PragmataProB_liga_0829.ttf"
    "PragmataProI_0829.ttf"
    "PragmataProI_liga_0829.ttf"
    "PragmataProR_0829.ttf"
    "PragmataProR_liga_0829.ttf"
    "PragmataProZ_0829.ttf"
    "PragmataProZ_liga_0829.ttf"
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
