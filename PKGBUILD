# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: nizox <nizzox@gmail.com>

pkgname=grun
pkgver=0.9.3
pkgrel=3
pkgdesc="GTK run dialog"
arch=('i686' 'x86_64')
url="http://code.google.com/p/$pkgname"
license=('GPL2')
depends=('gtk2')
backup=('etc/consfile' 'etc/gassoc')
source=("http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('7788783e5a18221ae591606075d3a8ee')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}


package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
