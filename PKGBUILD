# Contributor: Tom K <tomk@runbox.com>
# Contributor: Aaron Ali <t0nedef@causal.ca>
# Contributor: Lucas H. Gabrielli <heitzmann@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libctl
pkgver=4.3.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://ab-initio.mit.edu/wiki/index.php/Libctl"
pkgdesc="A free Guile-based library implementing flexible control files for scientific simulations."
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stevengj/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('37705b650c8d5fdb7e40c33e4d0b02eb9804edf316963ff1d8def35cb56387e5')
license=('LGPL')
options=('!libtool')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr LIBS="-lm" CFLAGS=" -fPIC"
  make 
}
package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
