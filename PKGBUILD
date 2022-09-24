# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Emmanuel Vodor <manu@paca.happy-dev.fr>
pkgname=d-tracker-control-git
pkgver=r25.4c7e470
pkgrel=1
epoch=
pkgdesc="Polybar module to control d-tracker"
arch=(x86_64)
url="https://github.com/ubermanu/polybar-d-tracker-control.git"
license=('MIT')
groups=()
depends=(d-tracker rofi)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(d-tracker-control)
conflicts=()
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
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "polybar-d-tracker-control"
  make DESTDIR="$pkgdir/" all
}
