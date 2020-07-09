# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=gimp-brushbox
_pkgname=GimpBrushBox
pkgver=2.1
_pkgver=${pkgver/./_}
pkgrel=4
pkgdesc='Set of brushes, presets, dynamics made by GrindGod'
arch=('any')
url='https://grindgod.deviantart.com/art/The-Gimp-BrushBox-v2-1-382881674'
license=('CCPL:cc-by-nc-sa')
depends=(gimp)
source=(manual://the_gimp_brushbox_v${_pkgver}_by_grindgod_d6byhe2.zip)
options=(!strip)
sha256sums=('0cc922ece8eb59ce84b784ab50ddd60b97b4991590cddcd1fd2fa76220928523')

package(){
  cd "$srcdir"/${_pkgname}_v${pkgver}
  install -Dm644 Readme.txt "$pkgdir"/usr/share/doc/$pkgname/Readme.txt
  install -dm755 "$pkgdir"/usr/share/gimp/2.0
  cp -r --no-preserve=mode {brushes,dynamics,gradients,tool-presets} "$pkgdir"/usr/share/gimp/2.0/
}
