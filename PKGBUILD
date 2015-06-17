# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=iptables-nftables
pkgver=1.4.15
pkgrel=1
pkgdesc='backward compatibility iptables/ip6tables user-space utility'
arch=(i686 x86_64)
url='http://netfilter.org/projects/nftables/'
license=(GPL2)
provides=(iptables)
conflicts=(iptables)
source=(http://git.netfilter.org/iptables-nftables/snapshot/iptables-nftables-$pkgver.zip)
sha1sums=('9ec2ab98ea4be0dc6570e17e9c62107fa769cb2b')

build() {
  cd iptables-nftables-$pkgver
  chmod +x ./autogen.sh
  ./autogen.sh
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd iptables-nftables-$pkgver
  make DESTDIR="$pkgdir" install
}
