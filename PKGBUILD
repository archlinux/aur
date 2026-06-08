# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Andy Hauser <andy-aur@splashground.de>

pkgname=rxp
pkgver=1.5.2
pkgrel=1
pkgdesc="a validating XML parser written in C"
url="https://www.cogsci.ed.ac.uk/~richard/rxp.html"
license=(GPL-2.0-or-later)
arch=(i686 x86_64)
depends=(glibc)
provides=(librxp.so)
source=("https://www.inf.ed.ac.uk/research/isddarch/admin/$pkgname-$pkgver.tar.gz")
sha256sums=('fa641b4a5185d0a1d9610c8245b9d5aff5972c1a28a0da94f3e38d69f6c14513')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package(){
  cd "${srcdir}/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
