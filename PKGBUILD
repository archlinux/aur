# Maintainer: Bao Trinh <aur@qubidt.com>

# requires that you already have a full copy of this font

pkgname=ttf-pragmatapro
pkgver=0.821
pkgrel=1
pkgdesc="PragmataPro by Fabrizio Schiavi"
arch=('any')
url="http://www.fsd.it/shop/fonts/pragmatapro/"
license=('http://www.fsd.it/fonts/eula.htm')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("LICENSE")
md5sums=('eb2608fd50ca421ecb9fc07de833a5ab')

package() {
  msg "You need a full copy of this font in order to install it"
  files=(
         "PragmataProB_0821.ttf"
         "PragmataProI_0821.ttf"
         "PragmataProR_0821.ttf"
         "PragmataProZ_0821.ttf"
         "PragmataPro_Mono_B_0821.ttf"
         "PragmataPro_Mono_I_0821.ttf"
         "PragmataPro_Mono_R_0821.ttf"
         "PragmataPro_Mono_Z_0821.ttf"
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
  msg "Found all files, instaling..."

  install -d "$pkgdir/usr/share/fonts/TTF/"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
