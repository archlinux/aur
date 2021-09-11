# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=tntdb
pkgver=1.4
pkgrel=2
pkgdesc="C++-class-library for easy access to databases (only sqlite support)"
url="http://www.tntnet.org"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('cxxtools' 'sqlite')
source=("http://www.tntnet.org/download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('48cefd354acf2579c80b77d789d67f8b8162f1a02a3c2fb8157a9a32dc332859')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --disable-static \
              --without-postgresql \
              --without-replicate \
              --without-mysql
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
