# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Ex-Maintainer: William Turner <willtur.will@gmail.com>
pkgname='python-booleanoperations'
_pkgname=booleanOperations
pkgver=0.8.2
pkgrel=1
pkgdesc='Boolean operations on paths.'
arch=('any')
url='https://github.com/typemytype/booleanOperations'
license=('MIT')
checkdepends=('python-fontpens')
depends=('python' 'python-pyclipper' 'python-fonttools')
makedepends=()
options=(!emptydirs)
source=("https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.zip")
sha256sums=('1750def605e53ca13cf45fedd31b360d241cc6082523e4b71d86c72dd3e9bc8a')

package() {
  cd "${srcdir}/$_pkgname-$pkgver"

  python setup.py install --root=$pkgdir ||return 1
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py test
}
