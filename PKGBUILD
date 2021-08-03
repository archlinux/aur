# Maintainer: Sergey Malkin <adresatt@gmail.com>
# Contributor: mcgyver <newsletter.sergio@gmail.com>

pkgbase=python-neo
#pkgname=('python-neo' 'python2-neo')
pkgname=('python-neo')
_name=${pkgbase#python-}
pkgver=0.10.0
pkgrel=1
pkgdesc="Neo is a package for representing electrophysiology data in Python, together with support for reading a wide range of neurophysiology file formats"
arch=('any')
url="https://pypi.org/project/neo/#files"
license=("custom")
#depends=("python-quantities" "python-setuptools" "python2-setuptools")
conflicts=("python2-neo")
depends=("python-quantities" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e591a53e18cfa4478603a0e133f3fa0e07bc016b2a279d21d72cf8196eca8353')

package_python-neo() {
  depends+=('python' 'python-numpy')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}

#package_python2-neo() {
#  depends+=('python2' 'python2-numpy')
#
#  cd "${srcdir}/${_name}-${pkgver}"
#  python2 setup.py install --root="${pkgdir}"
#}
