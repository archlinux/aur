# Maintainer: JP-Ellis <josh@jpellis.me>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-bibtexparser
_name=${pkgname#python-}
pkgver=1.1.0
pkgrel=1
pkgdesc="Bibtex parser in Python"
arch=('any')
url="https://pypi.org/project/bibtexparser/"
license=('LGPL3')
depends=('python' 'python-pyparsing')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('df8966ea752db6d74657a69b9d684a61aa33457ad6d9d50e41c50ef7f374907f')

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
