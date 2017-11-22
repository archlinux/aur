# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='pid-tools'
pkgdesc="Some commandline tools for dealing with pids, information about processes, and their relations"
pkgver=3.1.1
pkgrel=1
arch=('any')
license=('GPLv2')
url="http://github.com/kata198/pid-tools"
makedepends=('gcc' 'make')
source=("https://github.com/kata198/pid-tools/archive/${pkgver}.tar.gz")
sha512sums=("9d29002557aae38941a2fb5b3dc9e45a33624f9a54b0b31cacff9297f0d0d3aabe7676641c027583cd69ad7143c271e9797d7dcf952d7bfd8da64920119fb7db")

build() {
  cd "$srcdir/${pkgname}-$pkgver"

  make
}

package() {
  cd "${pkgname}-$pkgver"

  # Bug in MAKEFILE, have to end DESTDIR with /usr
  make install DESTDIR="${pkgdir}/usr"
}

