# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Daniele Marinello <m2346zc5-aur@yahoo.it>

pkgname=amule-emc
pkgver=0.5.2
pkgrel=1
pkgdesc="Multi-platform emulecollection parser written in C++"
arch=('i686' 'x86_64')
url="http://code.google.com/p/amule-emc/"
depends=('gcc-libs')
license=('GPL')
source=("http://amule-emc.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
sha1sums=('b50d125b0b24c9932e621c23c51c3da615051ef1')

prepare() {
  rm -fr build
  cp -R "${pkgname}-${pkgver}" build
}

build() {
  cd build
  ./configure --prefix=/usr
  make
}
package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

