# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=python-papis-rofi-git
_name=${pkgname#python-}
_name=${_name//-git}
provides=('python-papis-rofi')
_pkgver=0.1.1
pkgver=0.1.1.r2.5a60ed2
pkgrel=1
pkgdesc="Create simple GUIs using the Rofi application (fork for papis)"
arch=('any')
url="https://pypi.org/project/papis-rofi/"
license=('GPL')
depends=('python' 'papis' 'python-papis-python-rofi')
optdepends=()
makedepends=('python-setuptools')
source=(
  "git+https://github.com/papis/papis-rofi.git"
)
sha256sums=('SKIP')
noextract=()

pkgver() {
  cd "${srcdir}/${_name}"
  printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_name}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
