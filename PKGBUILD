# Contributor: Pablo Nicolas Diaz <pablonicolas.diaz at gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dmake
pkgver=4.13.1
pkgrel=1
pkgdesc="A make utility similar to GNU make or the Workshop dmake, formerly used by the OpenOffice.org build system."
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/mohawk2/dmake.git"
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jimjag/dmake/archive/v${pkgver}.tar.gz")
sha256sums=('816664f5299b2c0ddbb717e9dcbd15f15438a724a174256b5eba0c6a6d15be6f')

build() {
  cd ${pkgname}-${pkgver}
  ./configure  --prefix=/usr --enable-spawn 
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}


