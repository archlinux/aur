# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=libnftnl-git
pkgver=1.0.0.r6.g076fd1e
pkgrel=1
pkgdesc='Netfilter nf_tables infrastructure library'
arch=(i686 x86_64)
url='http://netfilter.org/projects/nftables/'
license=(GPL2)
depends=(libmnl)
makedepends=(git)
source=(git://git.netfilter.org/libnftnl)
sha1sums=('SKIP')

pkgver() {
  cd libnftnl
  git describe | sed 's/^libnftnl-//; s/-/.r/; s/-/./'
}

build() {
  cd libnftnl
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd libnftnl
  make check
}

package() {
  cd libnftnl
  make DESTDIR="$pkgdir" install
}
