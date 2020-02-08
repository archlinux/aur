# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=cgicc
pkgver=3.2.19
pkgrel=1
pkgdesc="C++ library that simplifies the creation of CGI applications"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://www.gnu.org/software/cgicc/"
license=('LGPL3')
makedepends=('doxygen')
options=()
source=("https://ftp.gnu.org/gnu/cgicc/$pkgname-$pkgver.tar.gz")
sha256sums=('2a17b976248de03447f9e36d6ce18a80749990d8543e2dfeea09c413eb67f7f0')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
