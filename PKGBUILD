# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=python-pylibgen
_name=${pkgname#python-}
pkgver=1.3.1
pkgrel=1
pkgdesc="Python interface to Library Genesis."
arch=('any')
url="https://pypi.org/project/pylibgen/"
license=('GPL')
depends=('python')
optdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('303b0f279504c6b97f7619835bc9005bdadf9860c8b7a5d8204b189747c471e7')
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
