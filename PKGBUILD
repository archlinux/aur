# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=python-filetype
_name=${pkgname#python-}
pkgver=1.0.7
pkgrel=1
pkgdesc="Small and dependency free Python package to infer file type and MIME type checking the magic numbers signature of a file or buffer."
arch=('any')
url="https://pypi.org/project/filetype/"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
optdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('da393ece8d98b47edf2dd5a85a2c8733e44b769e32c71af4cd96ed8d38d96aa7')
noextract=()

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
  touch Changelog.rst
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
