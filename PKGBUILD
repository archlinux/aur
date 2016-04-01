# Maintainer: Kaan Genç <aur@kaangenc.me>
pkgname=sqlite_modern_cpp
pkgver=2.2
pkgrel=1
pkgdesc="A lightweight modern C++ wrapper around sqlite C api."
arch=('i686' 'x86_64')
url="https://github.com/aminroosta/sqlite_modern_cpp"
license=('MIT')
depends=('sqlite')
source=("https://github.com/aminroosta/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('9b8e4edaf9f8b3d266e46648f6fd3d53')


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
