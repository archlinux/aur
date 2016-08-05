# Maintainer: Dmitrii Tcvetkov <demfloro@demfloro.ru>

pkgname=aggregate
pkgver=1.0.2
pkgrel=1
pkgdesc="Tool for aggregating CIDR IPv4 networks"
url="http://horms.net/projects/aggregate/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('vanessa-logger')
source=(http://horms.net/projects/aggregate/download/$pkgname-$pkgver.tar.gz)

build() {
  cd $srcdir/$pkgname-$pkgver
  sh ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR=$pkgdir install
}
sha256sums=('019dc17498515f470015a427891f8e70f4ec424ab9960e10cdfb6462bec607c0')
