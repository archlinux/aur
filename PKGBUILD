# Maintainer: Kalentia <kalentia.git@gmail.com>

# requires that you already have a full copy of this font

pkgname=otf-pragmatapro
pkgver=0.822
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
         "Pragmata Pro Bold.otf"
         "Pragmata Pro Italic.otf"
         "Pragmata Pro Regular.otf"
         "Pragmata Pro Bold Italic.otf"
         "Pragmata Pro Mono Bold.otf"
         "Pragmata Pro Mono Italic.otf"
         "Pragmata Pro Mono Regular.otf"
         "Pragmata Pro Mono Bold Italic.otf"
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

  install -d "${pkgdir}/usr/share/fonts/OTF/"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname"
}
