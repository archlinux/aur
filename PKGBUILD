# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=cgicc
pkgver=3.2.16
pkgrel=1
pkgdesc="C++ library that simplifies the creation of CGI applications"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/cgicc/"
license=('LGPL3')
makedepends=('doxygen')
source=("http://ftp.gnu.org/gnu/cgicc/$pkgname-$pkgver.tar.gz")
sha256sums=('9dceb36d2da52791ee11f2fb5bb6435c22e69ef50f38073c4329386b883d5aaa')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
