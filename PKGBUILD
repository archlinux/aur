# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=libredwg
pkgver=0.12.5
pkgrel=2
pkgdesc="A free C library to handle DWG files"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/libredwg/"
license=('GPL')
depends=('python' 'pcre2' 'perl' 'swig')
source=("$pkgname-$pkgver.tar.gz::https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('cbef6e83f3631c31ff2cbce23c77fac9')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}
package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

