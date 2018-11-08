# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=concurrencykit
_pkgname=ck
pkgver=0.6.0
pkgrel=1
pkgdesc="Concurrency primitives, safe memory reclamation mechanisms and non-blocking data structures for the research, design and implementation of high performance concurrent systems"
arch=('i686' 'x86_64')
url="http://www.concurrencykit.org/"
license=('BSD')
source=("https://github.com/concurrencykit/ck/archive/${pkgver}.tar.gz")
md5sums=('ff1b7e42a7cfd48ea15fd1a8b39e0509')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
