# Contributor: Tom K <tomk@runbox.com>
# Maintainer: Aaron Ali <t0nedef@causal.ca>
# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

pkgname=libctl
pkgver=3.2.2
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="A free Guile-based library implementing flexible control files for scientific simulations."
depends=('guile1.8' 'gcc-fortran')
source=(http://ab-initio.mit.edu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('5fd7634dc9ae8e7fa70a68473b9cbb68')
url="http://ab-initio.mit.edu/wiki/index.php/Libctl"
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
