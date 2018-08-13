# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=python-habanero
_name=${pkgname#python-}
pkgver=0.6.0
pkgrel=1
pkgdesc="Habanero is a low level client for working with Crossref's search API."
arch=('any')
url="https://pypi.org/project/habanero/"
license=('GPL')
depends=('python')
optdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('cd83f633c2fc0bfc3d20dd3c5852c84056230d119eb3aba9b94b03e423875788')
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
