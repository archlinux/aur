# Maintainer: Kaan Genç <aur@kaangenc.me>
pkgname=sqlite_modern_cpp
pkgver=2.1
pkgrel=1
pkgdesc="A lightweight modern C++ wrapper around sqlite C api."
arch=('i686' 'x86_64')
url="https://github.com/aminroosta/sqlite_modern_cpp"
license=('MIT')
depends=('sqlite')
source=("https://github.com/aminroosta/$pkgname/archive/$pkgver.tar.gz")
md5sums=('46d54a20050fd56def7c5ca3dcbab962')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
      --prefix=/usr
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
