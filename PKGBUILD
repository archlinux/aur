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
conflicts=(wofi-calc)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "${_pkgname}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   # Note: 'install' is a chmod+cp one-liner command by GNU
   mkdir -p "$pkgdir"/usr/bin
   install -m 555 "${srcdir}"/wofi-calc/wofi-calc.sh "$pkgdir"/usr/bin/wofi-calc
}
