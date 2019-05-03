# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=python-filetype
_name=${pkgname#python-}
pkgver=1.0.5
pkgrel=1
pkgdesc="Small and dependency free Python package to infer file type and MIME type checking the magic numbers signature of a file or buffer."
arch=('any')
url="https://pypi.org/project/filetype/"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
optdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('17a3b885f19034da29640b083d767e0f13c2dcb5dcc267945c8b6e5a5a9013c7')
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
