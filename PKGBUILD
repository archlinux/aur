# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=python-habanero
_name=${pkgname#python-}
pkgver=0.6.2
pkgrel=1
pkgdesc="Habanero is a low level client for working with Crossref's search API."
arch=('any')
url="https://pypi.org/project/habanero/"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
optdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('806c74298e0fb8a838514307ef3eca73685a968b8efd00e5dfe1ea604200f59d')
noextract=()

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  touch Changelog.rst
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
