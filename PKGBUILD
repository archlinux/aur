# Maintainer: Sergey Malkin <adresatt@gmail.com>
pkgbase=python-quantities
pkgname=('python-quantities' 'python2-quantities')
_name=${pkgbase#python-}
pkgver=0.12.4
pkgrel=1
pkgdesc="Support for physical quantities with units, based on numpy"
arch=('any')
url="https://pypi.org/project/quantities/#files"
license=('BSD')
makedepends=('python-setuptools'
             'python2-setuptools'
             'python-numpy'
             'python2-numpy')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('SKIP')

package_python-quantities() {
  depends+=('python')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}

package_python2-quantities() {
  depends+=('python2')

  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}
