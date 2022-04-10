# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Adrian Lopez <zeioth@hotmail.com>
pkgname=wofi-calc-git
pkgver=1.0.r3.7e6ecfa
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
sha256sums=('0bc4930e7df685389309198ce214ebf3b88aee71ca0198f586ff0afe6bea716b')
validpgpkeys=()

pkgver() {
  cd "${_pkgname}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   # Note: 'install' is a chmod+cp one-liner command by GNU
   mkdir -p "$pkgdir"/usr/bin
   install -m 111 "${srcdir}"/wofi-calc.sh "$pkgdir"/usr/bin/wofi-calc
}
