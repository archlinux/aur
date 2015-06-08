# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=hunspell-lv
pkgver=1.1.0
pkgrel=1
pkgdesc="Latvian hunspell dictionary"
arch=('any')
url="http://dict.dv.lv/download.php?prj=lv"
license=('LGPL2')
depends=('hunspell' 'hyphen')
source=("http://dict.dv.lv/download/lv_LV-$pkgver.zip")
sha256sums=('1845ee1ce23614ccb0ad29b1441827a53d137d7afdd7d40a835e996e8f899aa3')

package() {
    cd "$srcdir"
    install -D -m 644 lv_LV.aff "${pkgdir}/usr/share/hunspell/lv_LV.aff"
    install -D -m 644 lv_LV.dic "${pkgdir}/usr/share/hunspell/lv_LV.dic"
    install -d -m 755 ${pkgdir}/usr/share/myspell/dicts
    ln -s /usr/share/hunspell/lv_LV.aff "${pkgdir}/usr/share/myspell/dicts"
    ln -s /usr/share/hunspell/lv_LV.dic "${pkgdir}/usr/share/myspell/dicts"
    install -D -m 644 hyph_lv_LV.dic "${pkgdir}/usr/share/hyphen/hyph_lv_LV.dic"
    install -D -m 644 "README_lv_LV.txt" "${pkgdir}/usr/share/doc/hunspell-lv/README.txt"
    install -D -m 644 "README_hyph_lv_LV.txt" "${pkgdir}/usr/share/doc/hunspell-lv/README_hyph.txt"
}
# vim:set ts=2 sw=2 et:
