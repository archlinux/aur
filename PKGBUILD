# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=bubblefishymod
pkgver=0.6.4
pkgrel=2
pkgdesc="Plugin for gkrellm with duck and fishs."
arch=('i686' 'x86_64')
url="http://www.jnrowe.ukfsn.org/projects/bfm.html"
license=('GPL')
depends=('gkrellm')
source=("bfm-$pkgver.tar.bz2::http://download.chinaunix.net/down.php?id=1624&ResourceID=865&site=1")
md5sums=('db6395852d7d08a2481139497cc6a957')

build() {
  cd "$srcdir/bfm-$pkgver"
  make LDFLAGS=-shared gkrellm
}
package() {
  cd "$srcdir/bfm-$pkgver"
  install -D -m644 gkrellm-bfm.so "$pkgdir/usr/lib/gkrellm2/plugins/gkrellm-bfm.so"
}
