# Maintainer: Pierre Ayoub <pierre.ayoub@protonmail.com>
# Contributor: JP-Ellis <josh@jpellis.me>
pkgname=python-papis-python-rofi
_name=${pkgname#python-}
pkgver=1.0.3
pkgrel=1
pkgdesc="Create simple GUIs using the Rofi application (fork for papis)"
arch=('any')
url="https://pypi.org/project/papis-python-rofi/"
license=('GPL')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('358e24f5fb0a86de6f15d5168753ad4cbb97e52b36b1bd7abbad4053aeb6f621')
noextract=()

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
