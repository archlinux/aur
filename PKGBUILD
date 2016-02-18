# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=mimetic
pkgver=0.9.8
pkgrel=1
pkgdesc="a free, MIT licensed, Email library (MIME) written in C++"
url="http://www.codesink.org/mimetic_mime_library.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=()
source=(http://www.codesink.org/download/${pkgname}-${pkgver}.tar.gz)
md5sums=('7a00a73fac59fd86e5c145497786cfbe')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make -j1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
