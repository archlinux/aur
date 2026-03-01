# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guile-reader
_gitname=guile-reader
pkgver=0.6.4
pkgrel=1
pkgdesc="a simple framework for building readers for GNU Guile"
url="http://www.nongnu.org/guile-reader"
arch=('i686' 'x86_64')
license=('GPL')
depends=('guile')
makedepends=('gcc' 'gperf' 'git')
source=("http://download.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('6b220033ac2e71b7bef41a43f354c22b9986a675a4d12ed31cf744143a99135b')
options=('!strip')

build() {
  cd $pkgname-$pkgver
#  autoreconf -i --force --verbose
  CC=gcc CFLAGS= CPPFLAGS= LDFLAGS= GUILE_EFFECTIVE_VERSION=3.0 ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
