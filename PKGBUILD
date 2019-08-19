# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Ex-Maintainer: William Turner <willtur.will@gmail.com>
pkgname='python-mutatormath'
_pkgname=MutatorMath
pkgver=2.1.2
pkgrel=1
pkgdesc='A library for the calculation of piecewise linear interpolations in n-dimensions with any number of masters.'
arch=('any')
url='https://github.com/LettError/MutatorMath'
license=('BSD')
depends=('python' 'python-fonttools' 'python-defcon' 'python-fontmath')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.zip")
sha256sums=('6930f966a07a7459bcdb15b36dbcb615a791853d79965897cedb1047d5beeecb')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root=$pkgdir ||return 1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py test
}
