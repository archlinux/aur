# Contributor: Pablo Nicolas Diaz <pablonicolas.diaz at gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dmake
pkgver=4.12.2.2
_pkgver=4_12_2_2
pkgrel=1
pkgdesc="A make utility similar to GNU make or the Workshop dmake, formerly used by the OpenOffice.org build system."
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/mohawk2/dmake.git"
depends=('glibc')
source=("https://github.com/mohawk2/dmake/archive/DMAKE_${_pkgver}.tar.gz")
md5sums=('75cfc7b7e8bafe12e7b4c5ca13505607')

build() {
  cd ${pkgname}-DMAKE_${_pkgver}
  ./configure  --prefix=/usr --enable-spawn 
  make
}

package() {
  cd ${pkgname}-DMAKE_${_pkgver}
  make DESTDIR=${pkgdir} install
}

