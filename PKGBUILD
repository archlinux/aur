# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=parpd
pkgver=1.5.r32.g2518987
pkgrel=1
pkgdesc="Proxy-ARP daemon"
arch=(i686 x86_64)
url="https://github.com/rsmarples/parpd"
license=(BSD)
_commit=master
source=("git+https://github.com/rsmarples/parpd#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe | sed "s/^parpd-//; s/-/.r/; s/-/./"
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" BINDIR="/usr/bin" install
}

# vim: ts=2:sw=2:et
