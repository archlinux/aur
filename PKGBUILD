# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=cgicc
pkgver=3.2.18
pkgrel=1
pkgdesc="C++ library that simplifies the creation of CGI applications"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/cgicc/"
license=('LGPL3')
makedepends=('doxygen')
options=()
source=("https://ftp.gnu.org/gnu/cgicc/$pkgname-$pkgver.tar.gz")
sha256sums=('b04853abfc01668bd99479c7af43d685f0ca6dc759bdd00878e85a6106df4948')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
