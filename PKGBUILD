# Maintainer: Sasasu (i@sasa.su)
pkgname=libkmip
pkgver=0.2.0
pkgrel=1
pkgdesc='C implementation of the KMIP specification'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/OpenKMIP/libkmip'
license=('BSD')
depends=('openssl')
makedepends=()
source=("https://github.com/OpenKMIP/libkmip/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d9f9baacf8aabd7399be7f39aca232ac3eea9b4c7582e6f7115b88efbb41ab8a')

build() {
  cd libkmip-$pkgver

  make PREFIX=/usr
}

package() {
  cd libkmip-$pkgver

  make install PREFIX=/usr DESTDIR="$pkgdir"

  rm $pkgdir/usr/src -rf   # source file
  rm $pkgdir/usr/bin -rf   # demo file
  rm $pkgdir/usr/share -rf # doc generater
}

