# Maintainer: Milk Brewster (milkii on freenode irc)
pkgname=bchoppr-git
pkgver=r133.510ab2a
pkgrel=1
epoch=
pkgdesc="An audio stream chopping LV2 plugin."
arch=('x86_64')
url="https://github.com/sjaehn/BChoppr"
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
source=("git+https://github.com/sjaehn/BChoppr")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

# prepare() {
# }

pkgver() {
  cd "$srcdir"/BChoppr
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
 }


build() {
  cd "$srcdir"/BChoppr
  make
}
 
# check() {
	# cd "$pkgname-$pkgver"
	# make -k check
# }

package() {
  cd "$srcdir"/BChoppr
  # make INSTALL_DIR="${pkgdir}/usr/lib/lv2" install 
  make PREFIX="${pkgdir}/usr" install 
}
