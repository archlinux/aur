pkgname=ipv6toolkit
pkgver=2.0
pkgrel=1
pkgdesc="SI6 Networks' IPv6 Toolkit, a security assessment and troubleshooting tool"
arch=(i686 x86_64)
url="https://www.si6networks.com/tools/ipv6toolkit/"
license=(GPL3)
makedepends=(git)
_commit=cd6b535196d33b49e2d816afcbd4ce39761dd2b3
source=("git+https://github.com/fgont/ipv6toolkit#commit=$_commit")
sha256sums=('SKIP')
validpgpkeys=('666631C6D48463B28FB1E3C4AE250D551D4E7492')

build() {
  cd "$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" SBINPATH="$pkgdir"/usr/bin install
}

# vim: ts=2:sw=2:et
