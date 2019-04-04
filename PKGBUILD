# Maintainer: Wesley Moore <wes@wezm.net>
# Maintainer: Bao Trinh <aur@qubidt.com>

# requires that you already have a full copy of this font

pkgname=ttf-pragmatapro
pkgver=0.827
pkgrel=3
pkgdesc="PragmataPro by Fabrizio Schiavi"
arch=('any')
url="http://www.fsd.it/shop/fonts/pragmatapro/"
license=('http://www.fsd.it/fonts/eula.htm')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("LICENSE")
sha256sums=('8067e67a5d2153a8990ffc866de319a01d21f6021789812dd1a38219062e1475')

package() {
  msg "You need a full copy of this font in order to install it"
  files=(
    "PragmataProB_0827.ttf"
    "PragmataProB_liga_0827.ttf"
    "PragmataProI_0827.ttf"
    "PragmataProI_liga_0827.ttf"
    "PragmataPro_Mono_B_0827.ttf"
    "PragmataPro_Mono_B_liga_0827.ttf"
    "PragmataPro_Mono_I_0827.ttf"
    "PragmataPro_Mono_I_liga_0827.ttf"
    "PragmataPro_Mono_R_0827.ttf"
    "PragmataPro_Mono_R_liga_0827.ttf"
    "PragmataPro_Mono_Z_0827.ttf"
    "PragmataPro_Mono_Z_liga_0827.ttf"
    "PragmataProR_0827.ttf"
    "PragmataProR_liga_0827.ttf"
    "PragmataProZ_0827.ttf"
    "PragmataProZ_liga_0827.ttf"
  )

  for i in "${files[@]}"
  do
    if [[ ! -f $i ]]; then
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
