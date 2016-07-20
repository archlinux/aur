# Maintainer: OSO <osospeed@hotmail.com>
pkgname=vpnpivot-git
pkgver='r19.543fe1a'
pkgrel=1
pkgdesc="VPN pivoting in Linux using pure low-level sockets within tap device."
arch=('any')
url="https://github.com/0x36/VPNPivot.git"
makedepends=('git')
sha1sums=('SKIP')

source=("$pkgname"::'git+https://github.com/0x36/VPNPivot.git')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="${pkgdir}" install
}
