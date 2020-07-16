# Maintainer: JP-Ellis <josh@jpellis.me>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-bibtexparser
_name=${pkgname#python-}
pkgver=1.2.0
pkgrel=1
pkgdesc="Bibtex parser in Python"
arch=('any')
url="https://pypi.org/project/bibtexparser/"
license=('LGPL3')
depends=('python' 'python-pyparsing' 'python-future')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('0f9ab94e3fc36ee2ee6a3713c5dd7320d4b6ee52bd66ecbab03c6b06675ae410')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
  touch Changelog.rst
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  nosetests3
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
