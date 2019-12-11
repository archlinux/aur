# Maintainer: YOUNG HO CHA <ganadist@gmail.com>
pkgname=uftrace
pkgver=0.9.3
pkgrel=2
pkgdesc="Tool to trace and analyze execution of a program written in C/C++"
arch=(armv6h armv7h aarch64 x86_64)
url="https://github.com/namhyung/uftrace"
license=('GPL2')
groups=()
depends=(libelf python2 ncurses pkgconf luajit capstone)
makedepends=(pandoc)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
changelog=
source=("https://github.com/namhyung/uftrace/archive/v$pkgver.tar.gz")
noextract=()
# Use updpkgsums to update the checksum
sha256sums=('d801d72e3cdd83c510aeecc5160482d879498cf08fffd21e64f84151001e18ea')

build() {
  mkdir -p "$pkgname"/build
  cd "$pkgname"/build
  ../configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"/build
  make DESTDIR="$pkgdir/" install
}
