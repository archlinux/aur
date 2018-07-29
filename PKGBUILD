# Contributor: Tom K <tomk@runbox.com>
# Contributor: Aaron Ali <t0nedef@causal.ca>
# Contributor: Lucas H. Gabrielli <heitzmann@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libctl
pkgver=4.1.2
pkgrel=1
arch=('i686' 'x86_64')
url="http://ab-initio.mit.edu/wiki/index.php/Libctl"
pkgdesc="A free Guile-based library implementing flexible control files for scientific simulations."
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stevengj/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('684474731eadd5dd7cccad241051e605d93af3d7bb5d45d34bc92f6951f6bfa5')
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
