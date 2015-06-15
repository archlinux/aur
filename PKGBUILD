# Maintainer: Kazuo Teramoto <kaz.rag at gmail.com>
pkgname=dbacl
pkgver=1.14.1
pkgrel=1
pkgdesc="Digramic Bayesian classifier"
arch=('i686' 'x86_64')
url="http://dbacl.sourceforge.net/"
license=('GPL')
depends=('gawk' 'perl')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('94eef2cc2731c4807b5ffe5a04ee15e3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check()
{
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
