# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=ip2location-c
pkgver=7.0.0
pkgrel=1
pkgdesc="C library enables the user to find info of any IP address or hostname"
arch=(i686 x86_64)
url="http://www.ip2location.com/developers/c-7"
license=('GPL3' 'LGPL3')
depends=('')
source=("http://www.ip2location.com/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('25c3680b74da711e1315d218bb1c3641a6a1a75bf95bb83d448c88f449a8a473')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
