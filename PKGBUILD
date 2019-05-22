# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: PirateJonno <j@skurvy.no-ip.org>

pkgname=ballz
pkgver=1.0.4
pkgrel=2
pkgdesc="Platform game with some puzzle elements"
arch=('i686' 'x86_64')
url="https://gitlab.com/ballz/ballz"
license=('BSD')
depends=('guichan' 'dumb' 'allegro4' 'aldumb')
source=("https://gitlab.com/ballz/ballz/uploads/7e1eaf6c06dc982e9942fb055b7cc243/ballz-${pkgver}.tar.gz")
md5sums=('244efa2376dc9ee4018d3f93b0cc2c82')

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
