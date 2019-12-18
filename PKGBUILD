# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=vhdtool-git
pkgver=r24.cafd9bf
pkgrel=3
pkgdesc="Manipulate VHD (Virtual Hard Disk) images the open-source way."
arch=(x86_64)
url="https://github.com/andreiw/vhdtool"
license=(GPL)
depends=(glibc)
makedepends=(git)
source=("$pkgname::git+https://github.com/andreiw/vhdtool")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  make
}

package() {
  cd "$srcdir/$pkgname"

  install -d -m755 "$pkgdir/usr/bin"
  install -Dm755 vhdtool "$pkgdir/usr/bin"
}
