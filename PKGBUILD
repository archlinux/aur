# Maintainer: Jonathan Steel <jsteel@aur.archlinux.org>
# Contributor: Peter Simons <simons@cryp.to>

pkgname=shhmsg
pkgver=1.4.1
pkgrel=1
pkgdesc="Library for displaying messages"
arch=('i686' 'x86_64')
url="http://shh.thathost.com/pub-unix"
license=('GPL')
options=('staticlibs')
source=($url/files/$pkgname-$pkgver.tar.gz)
md5sums=('de300150851786eb19cb9b9ad234d7a2')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  make OPTIM="$CFLAGS" dep
  make OPTIM="$CFLAGS"
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make OPTIM="$CFLAGS" INSTBASEDIR="$pkgdir"/usr/ install
}
