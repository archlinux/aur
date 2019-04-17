# Maintainer: Milk Brewster (milk on freenode irc)
pkgname=bshapr-git
pkgver=r105.a7b5643
pkgrel=1
epoch=
pkgdesc="Beat / envelope shaper LV2 plugin"
arch=('x86_64')
url="https://github.com/sjaehn/BShapr"
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
source=("git+https://github.com/sjaehn/BShapr")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

# prepare() {
# }

pkgver() {
  cd "$srcdir"/BShapr
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
 }


build() {
  cd "$srcdir"/BShapr
}
 
# check() {
	# cd "$pkgname-$pkgver"
	# make -k check
# }

package() {
  cd "$srcdir"/BShapr
  make INSTALL_DIR="${pkgdir}/usr/lib/lv2" install 
}
