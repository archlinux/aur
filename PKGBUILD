# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=papis-rofi-git
_name=${pkgname//-git}
provides=('python-papis-rofi')
_pkgver=0.2.0
pkgver=0.2.0.r5.2cb5b88
pkgrel=1
pkgdesc="Rofi interface for papis"
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
