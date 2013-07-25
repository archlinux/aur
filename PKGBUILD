# Maintainer: jsteel <jsteel@aur.archlinux.org>
# Contributor: Peter Simons <simons@cryp.to>

pkgname=shhopt
pkgver=1.1.7
pkgrel=1
pkgdesc="Library for parsing command line options"
arch=('i686' 'x86_64')
url="http://shh.thathost.com/pub-unix"
license=('GPL')
source=($url/files/$pkgname-$pkgver.tar.gz)
md5sums=('caf24206354296e8a48771aea1f47fbd')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  make OPTIM="$CFLAGS" dep
  make OPTIM="$CFLAGS"
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make OPTIM="$CFLAGS" INSTBASEDIR="$pkgdir"/usr/ install
}
