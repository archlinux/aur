# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
#             Jengenijs Protopopovs <jprotopopov1122 at gmail dot com>
pkgname=hunspell-lv
pkgver=1.4.0
pkgrel=1
pkgdesc='Latvian hunspell dictionary'
arch=('any')
url='http://dict.dv.lv/download.php?prj=lv'
license=('LGPL2')
depends=('hunspell' 'hyphen')
source=("http://dict.dv.lv/download/lv_LV-${pkgver}.zip")
sha256sums=('9366f562671ea3d7c850793d3c39ac2593c20592b916500160240cccb0e3cb4e')

package() {
  install -Dm644 lv_LV.aff "$pkgdir/usr/share/hunspell/lv_LV.aff"
  install -Dm644 lv_LV.dic "$pkgdir/usr/share/hunspell/lv_LV.dic"

  install -dm755 "$pkgdir/usr/share/myspell/dicts"
  ln -s /usr/share/hunspell/lv_LV.aff "$pkgdir/usr/share/myspell/dicts"
  ln -s /usr/share/hunspell/lv_LV.dic "$pkgdir/usr/share/myspell/dicts"

  install -Dm644 hyph_lv_LV.dic "$pkgdir/usr/share/hyphen/hyph_lv_LV.dic"
  install -Dm644 README_lv_LV.txt "$pkgdir/usr/share/doc/hunspell-lv/README.txt"
  install -Dm644 README_hyph_lv_LV.txt "$pkgdir/usr/share/doc/hunspell-lv/README_hyph.txt"
}
