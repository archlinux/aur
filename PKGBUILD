# Maintainer: Milk Brewster (milk on freenode irc)
pkgname=bsequencer-git
pkgver=r82.c4dd235
pkgrel=1
epoch=
pkgdesc="Multi channel MIDI step sequencer LV2 plugin."
arch=('x86_64')
url="https://github.com/sjaehn/BSEQuencer"
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
source=("git+https://github.com/sjaehn/BSEQuencer")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

# prepare() {
# }

pkgver() {
  cd "$srcdir"/BSEQuencer
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
 }


build() {
  cd "$srcdir"/BSEQuencer
  make
}
 
# check() {
	# cd "$pkgname-$pkgver"
	# make -k check
# }

package() {
  cd "$srcdir"/BSEQuencer
  make install PREFIX="${pkgdir}/usr/" install 
}
