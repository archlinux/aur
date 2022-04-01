# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Contributor: Tai Chi Minh Ralph Eastwood <tcmreastwood@gmail.com>

pkgname=libpgf
pkgver=7.21.7
pkgrel=1
pkgdesc="An implementation of the Progressive Graphics File (PGF)"
arch=('x86_64')
url="https://www.libpgf.org"
depends=('gcc-libs')
makedepends=('dos2unix')
license=('GPL')
source=("https://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/libpgf.zip")
sha1sums=('86027b9701e2b2516177991b7b96503f9b66b3b5')

build() {
  cd libpgf
  find . -type f | xargs dos2unix
  mv README{.txt,}
  sh autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd libpgf
  make DESTDIR="${pkgdir}" install
}
