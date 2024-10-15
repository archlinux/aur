# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor:
pkgname=gprofng-gui
pkgver=1.1
pkgrel=1
pkgdesc="A full-fledged graphical interface to operate gprofng."
arch=('any')
url="https://www.gnu.org/software/${pkgname}/"
license=('GPL-3.0-or-later')
depends=('java-runtime<=21')
makedepends=('java-environment<=21')
source=(https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('94fa577b856f00b89a2832771a265e221818b88dc0b36d8bca365efe6f08e12a')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}/
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}/
  make DESTDIR="$pkgdir" install
}
