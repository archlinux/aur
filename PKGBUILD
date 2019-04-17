# Maintainer: Milk Brewster (milk on freenode irc)
pkgname=bamp-git
pkgver=r26.722d5ab
pkgrel=1
epoch=
pkgdesc="Simple amplifier LV2 plugin using BWidgets GUI."
arch=('x86_64')
url="https://github.com/sjaehn/BAmp"
license=('GPL')
groups=()
depends=('xorg-server' 'cairo' 'lv2')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/sjaehn/BAmp")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

# prepare() {
# }

pkgver() {
  cd "$srcdir"/BAmp
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
 }


build() {
  cd "$srcdir"/BAmp
}
 
# check() {
	# cd "$pkgname-$pkgver"
	# make -k check
# }

package() {
  cd "$srcdir"/BAmp
  make INSTALL_DIR="${pkgdir}/usr/lib/lv2" install 
}
