# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guile-reader
_gitname=guile-reader
pkgver=0.6.3
pkgrel=2
pkgdesc="a simple framework for building readers for GNU Guile"
url="http://www.nongnu.org/guile-reader"
arch=('i686' 'x86_64')
license=('GPL')
depends=('guile')
makedepends=('gperf' 'git')
source=("http://download.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('38c2b444eadbb8c0cab78d90a44ec3ebff42bd410c5b84a91018cee7eb64d2bb')
options=('!strip')

build() {
  cd $pkgname-$pkgver
  autoreconf -i --force --verbose
  CFLAGS= CPPFLAGS= LDFLAGS= GUILE_EFFECTIVE_VERSION=3.0 ./configure --prefix=/usr 
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
