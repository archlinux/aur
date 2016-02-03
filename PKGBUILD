# Maintainer: Steven Allen <steven@stebalien.com>
# Contributor: mizux <webmaster@mizux.net>
# Contributor: Peter Simons <simons@cryp.to>
pkgname=mscgen
pkgver=0.20
pkgrel=3
pkgdesc="Message Sequence Chart Generator"
arch=('i686' 'x86_64')
url='http://www.mcternan.me.uk/mscgen/'
license=('GPL')
depends=('gd')
makedepends=()
options=()
source=( "http://www.mcternan.me.uk/mscgen/software/$pkgname-src-$pkgver.tar.gz" )
sha256sums=('3c3481ae0599e1c2d30b7ed54ab45249127533ab2f20e768a0ae58d8551ddc23')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-freetype
  make all
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
