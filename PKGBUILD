# Maintainer: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=kgdb-agent-proxy
pkgver=1.96
pkgrel=1
pkgdesc='A simple, small proxy which was intended for use with kgdb, or gdbserver type connections where you want to share a text console and a debug session.'
url='https://kgdb.wiki.kernel.org/index.php/Main_Page'
arch=(i686 x86_64)
depends=(glibc)
makedepends=(git)
license=(GPL2)
source=(git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git#tag=agent-proxy-$pkgver)
sha1sums=('SKIP')

build() {
  cd agent-proxy
  make
}

package() {
  cd agent-proxy
  install -d "$pkgdir"/usr/bin
  install -m755 agent-proxy "$pkgdir"/usr/bin
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
