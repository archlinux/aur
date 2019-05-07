# Maintainer: Robert Manner <the_manni at users.sf.net>

_lang=hun-eng
pkgname=dict-freedict-${_lang}
pkgver=0.4.1
pkgrel=1
pkgdesc="Hungarian - English dictionary for dictd from Freedict.org"
arch=('any')
url="http://www.freedict.org"
license=('GPL')
options=(!strip !zipman)
groups=()
depends=(dictd)
optdepends=(
  'dict-freedict-eng-hun: Dictionary for the reversed direction.'
)
install=freedict-${_lang}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.dictd.tar.xz")
md5sums=('f429bd13a10033b0c26b1674cb02a5ad')

package()
{
  install -m 755 -d "${pkgdir}/usr/share/dictd"
  install -m 644 -t "${pkgdir}/usr/share/dictd/" \
    ${_lang}/${_lang}.{dict.dz,index}
}
