# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=parpd
pkgver=1.5.r32.g2518987
pkgrel=1
pkgdesc="Proxy-ARP daemon"
arch=(i686 x86_64)
url="https://github.com/rsmarples/parpd"
license=(BSD)
_commit=25189870255c8b48e52ccf2976d4e77611bf70cd
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
