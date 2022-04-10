# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Adrian Lopez <zeioth@hotmail.com>
pkgname=wofi-calc-git
pkgver=1.0.r17.56372a9
pkgrel=1
epoch=
pkgdesc="A simple calculator for wofi, inspired in rofi-calc."
arch=(any)
url="https://github.com/Zeioth/wofi-calc.git"
license=('MIT')
groups=()
depends=(wofi libqalculate)
makedepends=(wofi libqalculate)
checkdepends=()
optdepends=()
provides=(wofi-calc-git)
conflicts=(wofi-calc-git)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://raw.githubusercontent.com/Zeioth/wofi-calc/main/wofi-calc.sh")
noextract=()
md5sums=('db674463102b04493962f4ed1f3d73fa')
validpgpkeys=()

pkgver() {
  cd "${_pkgname}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  sudo cp "${srcdir}"/wofi-calc/wofi-calc.sh /usr/bin/wofi-calc
  sudo chmod u+x /usr/bin/wofi-calc
}
