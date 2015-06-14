# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=gimp-brushbox
_pkgname=GimpBrushBox
pkgver=2.1
_pkgver=${pkgver/./_}
pkgrel=1
pkgdesc='Set of brushes, presets, dynamics made by GrindGod'
arch=('any')
url='http://grindgod.deviantart.com/art/The-Gimp-BrushBox-v2-1-382881674'
license=('CCPL:cc-by-nc-sa')
depends=(gimp)
source=("$pkgname-$pkgver.zip::http://fc04.deviantart.net/fs70/f/2013/204/d/2/the_gimp_brushbox_v${_pkgver}_by_grindgod-d6byhe2.zip")
options=(!strip)

package(){
  cd "$srcdir"/${_pkgname}_v${pkgver}
  install -Dm644 Readme.txt "$pkgdir"/usr/share/doc/$pkgname/Readme.txt
  install -dm755 "$pkgdir"/usr/share/gimp/2.0
  cp -r --no-preserve=mode {brushes,dynamics,gradients,tool-presets} "$pkgdir"/usr/share/gimp/2.0/

}
md5sums=('6549d759e9c491098a928d7b3c7fed37')
