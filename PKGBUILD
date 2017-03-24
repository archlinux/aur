# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=parpd
pkgver=1.6.r3.g8f2d1fa
pkgrel=1
pkgdesc="Proxy-ARP daemon"
arch=(i686 x86_64)
url="https://github.com/rsmarples/parpd"
license=(BSD)
_commit=8f2d1fafd1a28025b2558fc42ad03768b489facd
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
