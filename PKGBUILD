# Maintainer: Peter Cai <peter at typeblog dot net>
pkgname=udp2raw-tunnel
pkgver=20170809.0
pkgrel=1
pkgdesc='An Encrpyted,Anti-Replay,Multiplexed Udp Tunnel,tunnels udp traffic through fake-tcp or icmp by using raw socket'
arch=('x86_64' 'i686')
depends=()
makedepends=('gcc' 'make')
url='https://github.com/wangyu-/udp2raw-tunnel'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wangyu-/udp2raw-tunnel/archive/$pkgver.tar.gz")

build() {
  cd $pkgname-$pkgver
  sed -i -e '/^	sudo/ d' makefile
  sed -i -e '/^	sleep/ d' makefile
  make fast
}

package() {
  cd $pkgname-$pkgver
  mkdir -p $pkgdir/usr/bin/
  install -m755 udp2raw $pkgdir/usr/bin/
}
md5sums=('d08220400cf60adb0775b5d01645efd6')
