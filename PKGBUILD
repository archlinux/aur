# Maintainer: Cravix <dr dot neemous at gmail dot com>
# Contributor: Veli-Jussi Raitila <vjr AT iki DOT fi>

pkgname=python-charade
_pkgname=charade
pkgver=1.0.3
pkgrel=1
pkgdesc="Universal encoding detector for Python 2 and 3. Python3 version."
arch=('any')
url="https://github.com/sigmavirus24/charade"
license=('LGPL')
depends=('python')

source=(http://pypi.python.org/packages/source/c/charade/${_pkgname}-${pkgver}.tar.gz)
md5sums=('79ac701a147705c09bdce31b79dfa12e')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  
  python3 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python3 setup.py install --root="$pkgdir" || return 1
}
