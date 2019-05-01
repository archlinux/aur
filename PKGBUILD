# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Vinay S Shastry <vinayshastry@gmail.com>

pkgname=qmpdclient
pkgver=1.2.2
pkgrel=7
pkgdesc="A Qt4 client for MPD"
arch=('x86_64')
url="https://bitcheese.net/wiki/QMPDClient"
license=('GPL')
depends=('qt4')
makedepends=('cmake')
changelog=$pkgname.changelog
source=(https://dump.bitcheese.net/files/$pkgname-$pkgver.tar.bz2)
sha256sums=('ed65705eaae8fb10fdce34ce20e010757a87423c2874479e1466e4368a866289')

build() {
  cd "${srcdir}"
  mkdir build
  cd build

  cmake ../${pkgname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
