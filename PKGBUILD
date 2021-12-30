# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Adrian Lopez <zeioth@hotmail.com>
pkgname=wofi-calc-git
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="A simple calculator for wofi, inspired in rofi-calc."
arch=(x86_64 i686)
url="https://github.com/Zeioth/wofi-calc.git"
license=('MIT')
groups=()
depends=(wofi libqalculate)
makedepends=(wofi libqalculate)
checkdepends=()
optdepends=()
provides=(wofi-calc-git)
conflicts=(wofi-calc)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "${_pkgname}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cp "${srcdir}"/wofi-calc/wofi-calc.sh ~/.local/bin/wofi-calc
  chmod u+x ~/.local/bin/wofi-calc
}
