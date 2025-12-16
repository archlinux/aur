# Contributor: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=kgdb-agent-proxy
pkgver=1.97
pkgrel=1
pkgdesc='agent-proxy for kgdb'
url='https://archive.kernel.org/oldwiki/kgdb.wiki.kernel.org/'
arch=(i686 x86_64)
depends=(glibc)
makedepends=(git)
license=(GPL2)
source=(git+https://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git#tag=agent-proxy-$pkgver)
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
