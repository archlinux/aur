# Contributor: Tom K <tomk@runbox.com>
# Contributor: Aaron Ali <t0nedef@causal.ca>
# Contributor: Lucas H. Gabrielli <heitzmann@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libctl
pkgver=4.1.4
pkgrel=1
arch=('i686' 'x86_64')
url="http://ab-initio.mit.edu/wiki/index.php/Libctl"
pkgdesc="A free Guile-based library implementing flexible control files for scientific simulations."
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stevengj/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('76f5933e74151486e0c51bd881987ab87d1299a0dea2c4f088ba5a6fc118590b')
license=('LGPL')
options=('!libtool')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr LIBS="-lm" 
  make 
}
package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
