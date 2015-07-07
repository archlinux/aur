# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgbase=python-phpserialize
pkgname=('python-phpserialize' 'python2-phpserialize')
_pyname=phpserialize
pkgver=1.3
pkgrel=1
pkgdesc='A port of the serialize and unserialize functions of php to python.'
arch=('any')
url='https://github.com/mitsuhiko/phpserialize'
license=('BSD')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('cbf88a62e04135e3be3c7fe412525b8b')

prepare() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  cp -r "${srcdir}/${_pyname}-${pkgver}" "${srcdir}/${_pyname}-${pkgver}-py2"
}

package_python-phpserialize() {
  depends=('python' 'python-setuptools')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-phpserialize() {
  depends=('python2' 'python2-setuptools')
  cd "${srcdir}/${_pyname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
