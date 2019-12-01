# Maintainer: JP-Ellis <josh@jpellis.me>
pkgname=python-doi
_name=${pkgname}
pkgver=0.1.1
pkgrel=1
pkgdesc="Python package to work with Document Object Identifier (doi)."
arch=('any')
url="https://pypi.org/project/python-doi"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('1c507f2dad866d20b087ecebc86f560a62a4d083583e730cf07105d24861ded3')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
  touch Changelog.rst
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
