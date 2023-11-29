# Maintainer: Frederic Bezies <fredbezies @ gmail dot com>
pkgname=b-em-git
_pkgname=b-em
pkgver=r1856.b5134db
pkgrel=1
pkgdesc="BBC Micro emulator - git version"
arch=('x86_64')
url="http://b-em.bbcmicro.com/"
license=('GPL2')
depends=(allegro alsa-lib gcc-libs glibc jack zlib)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(git+https://github.com/stardot/b-em.git)
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
   make
}

package() {
  cd "$_pkgname"
  make prefix="$pkgdir/usr/" install
}

# vim:set ts=2 sw=2 et:
