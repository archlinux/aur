# Maintainer: quomoow <quomoow@gmail.com>

pkgname="python2-pyphen"
_pkgname="Pyphen"
pkgver=0.9.4
pkgrel=1
pkgdesc="Library to hyphenate text using included or external Hunspell hyphenation dictionaries"
license=('GPL2' 'LGPL2.1' 'MPL')
arch=('any')
url="http://pyphen.org/"
makedepends=('python2')
depends=()
_pkgname_initial=$(echo ${_pkgname}|cut -c1)
source=("https://github.com/Kozea/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('5b27217dde553bc0fdd3f7d3878e85a4')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python2 setup.py install --root="${pkgdir}" --optimize=1
}
