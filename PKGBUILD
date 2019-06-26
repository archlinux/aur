# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=python-pylibgen
_name=${pkgname#python-}
pkgver=2.0.2
pkgrel=1
pkgdesc="Python interface to Library Genesis."
arch=('any')
url="https://pypi.org/project/pylibgen/"
license=('GPL')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('87b28a27fa7c1912e2b38020262dd6086b292d670b0c08d76baecbcd7678b9ee')
noextract=()

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  touch Changelog.rst
  touch requirements-dev.txt
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
