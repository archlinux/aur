# Maintainer: Dario Ostuni <another.code.996@gmail.com>

pkgname=cgicc
pkgver=3.2.20
pkgrel=1
pkgdesc="C++ library that simplifies the creation of CGI applications"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://www.gnu.org/software/cgicc/"
license=('LGPL3')
makedepends=('doxygen')
options=()
source=("https://ftp.gnu.org/gnu/cgicc/$pkgname-$pkgver.tar.gz")
sha256sums=('0f91c5ce8adf406ad35a46152ffb2b9c8d6079604b796d81f48b66d1f068ad4e')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
