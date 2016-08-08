# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: PirateJonno <j@skurvy.no-ip.org>

pkgname=ballz
pkgver=1.0.2
pkgrel=2
pkgdesc="Platform game with some puzzle elements"
arch=('i686' 'x86_64')
url="http://code.google.com/p/db-tins07/"
license=('BSD')
depends=('guichan' 'dumb')
source=("http://db-tins07.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('9d0034bffcb110422a3a4ad5ce7686ca')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver  
  make DESTDIR="$pkgdir/" install
  install -Dm644 BSD-license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
