# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Kaan Genç <aur@kaangenc.me>
pkgname=sqlite_modern_cpp
pkgver=3.2
pkgrel=1
pkgdesc="A lightweight modern C++ wrapper around sqlite C api."
arch=('i686' 'x86_64')
url="https://github.com/aminroosta/sqlite_modern_cpp"
license=('MIT')
depends=('sqlite')
source=("https://github.com/aminroosta/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('7e54cc41713247c9f6373a441854e8dace8e334e6ee29f870f11bc3fd3b53b5cff4e1a6d4c7e3cda33509b70a3f9a47363922a589b9a6d0730ce6dc0c884d878')


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
