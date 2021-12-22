# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=python-habanero
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc="Habanero is a low level client for working with Crossref's search API."
arch=('any')
url="https://pypi.org/project/habanero/"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
optdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2763debc455841e28715ff20c9884249e1b2eecfd22c20967928e1eb657a0fe5')
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
