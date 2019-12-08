# Maintainer: Robert Manner <the_manni at users.sf.net>

_lang=eng-hun
pkgname=dict-freedict-eng-hun
pkgver=0.2.1
pkgrel=1
pkgdesc="English - Hungarian dictionary for dictd from Freedict.org"
arch=('any')
url="http://www.freedict.org"
license=('GPL')
options=(!strip !zipman)
groups=()
depends=(dictd)
optdepends=(
  'dict-freedict-hun-eng: Dictionary for the reversed direction.'
)
install=freedict-${_lang}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.dictd.tar.xz")
md5sums=('0c90c8ce3624358e7b0e52cb7f9ecc54')

package()
{
  install -m 755 -d "${pkgdir}/usr/share/dictd"
  install -m 644 -t "${pkgdir}/usr/share/dictd/" \
    ${_lang}/${_lang}.{dict.dz,index}
}
