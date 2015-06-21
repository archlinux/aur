# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>
pkgname=libfolia
pkgver=0.13
pkgrel=1
pkgdesc="C++ library for FoLiA (Format for Linguistic Annotation)"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('ticcutils' 'icu' 'libxml2')
makedepends=('libtool' 'autoconf')
options=(!libtool)
url="http://proycon.github.io/folia"
source=("http://software.ticc.uvt.nl/$pkgname-$pkgver.tar.gz")
md5sums=('9053c8eaefb83131d1f31eaccd844608')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
