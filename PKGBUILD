# Contributor: Tom K <tomk@runbox.com>
# Contributor: Aaron Ali <t0nedef@causal.ca>
# Contributor: Lucas H. Gabrielli <heitzmann@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libctl
pkgver=3.2.2
pkgrel=4
arch=('i686' 'x86_64')
url="http://ab-initio.mit.edu/wiki/index.php/Libctl"
pkgdesc="A free Guile-based library implementing flexible control files for scientific simulations."
depends=('guile1.8' 'gcc-fortran')
source=("https://github.com/stevengj/$pkgname/files/1323238/$pkgname-$pkgver.tar.gz")
md5sums=('5fd7634dc9ae8e7fa70a68473b9cbb68')
license=('GPL')
options=('!libtool')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  ./configure --prefix=/usr LIBS="-lm" GUILE='/usr/bin/guile1.8' GUILE_CONFIG='/usr/bin/guile-config1.8'
  make 
}
package() {
  cd ${srcdir}/$pkgname-$pkgver
  make DESTDIR=${pkgdir} install
}
