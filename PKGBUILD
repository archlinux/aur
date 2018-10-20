# Maintainer: Eric Le Lay <contact at elelay dot fr>
pkgname=ansifilter
pkgver=2.11
pkgrel=0
pkgdesc="remove or convert ANSI codes to another format"
arch=('i686' 'x86_64')
url='http://www.andre-simon.de/doku/ansifilter/en/ansifilter.php'
license=('GPL3')
depends=(gcc-libs)
makedepends=()
optdepends=()
source=("http://www.andre-simon.de/zip/$pkgname-$pkgver.tar.bz2")
sha256sums=('51e79ea56ba0e5a6cd564bd66e050f366be0e61c71a2b5800a3a213f8b39a9ca')

build() {
  cd "$pkgname-$pkgver"

  make all
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  rm "$pkgdir/usr/share/doc/ansifilter/COPYING" \
     "$pkgdir/usr/share/doc/ansifilter/INSTALL"
}
