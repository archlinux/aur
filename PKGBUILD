# Maintainer: Milk Brewster (milk on freenode irc)
pkgname=bslizr-git
pkgver=r126.bed9c29
pkgrel=1
epoch=
pkgdesc="Sequenced audio slicing effect LV2 plugin with a step sequencer effect. "
arch=('x86_64')
url="https://github.com/sjaehn/BSlizr"
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
source=("git+https://github.com/sjaehn/BSlizr")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

# prepare() {
# }

pkgver() {
  cd "$srcdir"/BSlizr
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
 }


build() {
  cd "$srcdir"/BSlizr
  make
}
 
# check() {
	# cd "$pkgname-$pkgver"
	# make -k check
# }

package() {
  cd "$srcdir"/BSlizr
  # make INSTALL_DIR="${pkgdir}/usr/lib/lv2" install 
  make PREFIX="${pkgdir}/usr" install 
}
