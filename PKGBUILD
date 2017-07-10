# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Peter Simons <simons@cryp.to>

pkgname=shhopt
pkgver=1.1.7
pkgrel=3
pkgdesc="Library for parsing command line options"
arch=('i686' 'x86_64')
url="http://shh.thathost.com/pub-unix"
license=('PerlArtistic')
options=('staticlibs')
source=($url/files/$pkgname-$pkgver.tar.gz)
md5sums=('caf24206354296e8a48771aea1f47fbd')

build() {
  cd $pkgname-$pkgver

  make OPTIM="$CFLAGS" dep
  make OPTIM="$CFLAGS"
}

package() {
  cd $pkgname-$pkgver

  make OPTIM="$CFLAGS" INSTBASEDIR="$pkgdir"/usr/ install

  for i in ChangeLog CREDITS INSTALL README; do
    install -Dm644 $i "$pkgdir"/usr/share/doc/$pkgname/$i
  done
}
