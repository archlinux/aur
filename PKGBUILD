# Maintainer: Eric Le Lay <contact at elelay dot fr>
pkgname=ansifilter
pkgver=2.1
pkgrel=1
pkgdesc="remove or convert ANSI codes to another format"
arch=('i686' 'x86_64')
url='http://www.andre-simon.de/doku/ansifilter/en/ansifilter.php'
license=('GPL3')
depends=(gcc-libs)
makedepends=()
optdepends=()
source=("http://www.andre-simon.de/zip/$pkgname-$pkgver.tar.bz2")
sha256sums=('9614d637694d8b4144ac5b7c4815520187021f1ab78ebce7bcc1e54b60809b83')

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