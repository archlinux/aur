# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Kaan Genç <aur@kaangenc.me>
pkgname=sqlite_modern_cpp
pkgver=2.4
pkgrel=1
pkgdesc="A lightweight modern C++ wrapper around sqlite C api."
arch=('i686' 'x86_64')
url="https://github.com/aminroosta/sqlite_modern_cpp"
license=('MIT')
depends=('sqlite')
source=("https://github.com/aminroosta/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('7f493d299ee5ec96ae2306e624f548b8')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
      --prefix=/usr \
      --libdir=/usr/lib
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
