# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Chris Mortimore <chris.mortimore@googlemail.com>
# Contributor: my64 <package@obordes.com>

pkgname=gkrellaclock
pkgver=0.3.4
pkgrel=3
pkgdesc="Analog clock"
arch=('i686' 'x86_64')
license=('GPL')
url="http://sites.google.com/site/gkrellaclock"
depends=('gkrellm')
source=(http://oborlinux.free.fr/arch/$pkgname-$pkgver.tar.gz)
md5sums=('37957ad3db335af4ed62dcab00856b09')

build() {
  cd "$srcdir/gkrellAclock-0.3.4"
  rm *.o
  make
}

package() {
  cd "$srcdir/gkrellAclock-0.3.4"
  install -Dm755 gkrellaclock.so "$pkgdir/usr/lib/gkrellm2/plugins/gkrellaclock.so"
}
