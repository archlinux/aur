# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=ssmalloc-git
pkgver=r11.47f69d4
pkgrel=1
pkgdesc='A Low-latency, Locality-conscious Memory Allocator with Stable Performance Scalability'
arch=(x86_64)
url='http://ipads.se.sjtu.edu.cn/ssmalloc'
license=(BSD)
makedepends=(git)
source=(git://github.com/Naruil/SSMalloc)
sha1sums=('SKIP')

pkgver() {
  cd SSMalloc
  # ssmalloc repo does not have any git tags yet
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd SSMalloc
  make
}

package() {
  cd SSMalloc
  mkdir -p "$pkgdir"/usr/lib
  install libssmalloc.a "$pkgdir"/usr/lib
  install libssmalloc.so "$pkgdir"/usr/lib
  #make install DESTDIR="$pkgdir"
}

