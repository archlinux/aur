# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=python-pylibgen
_name=${pkgname#python-}
pkgver=2.0.1
pkgrel=1
pkgdesc="Python interface to Library Genesis."
arch=('any')
url="https://pypi.org/project/pylibgen/"
license=('GPL')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3c2a82b47cb7225dcf4ecea27081b0185ae4d195499140cdbb9597d914e1ae9e')
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
