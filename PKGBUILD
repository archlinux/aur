# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Nick Smallbone <nick.smallbone@gmail.com>

pkgname=tofrodos
pkgver=1.7.13
pkgrel=3
arch=('x86_64')
pkgdesc="Convert ASCII files between the MS-DOS/Windows format and the UNIX format"
url="https://www.thefreecountry.com/tofrodos/index.shtml"
license=('GPL2')
depends=('glibc')
source=(https://fossies.org/linux/misc/$pkgname-$pkgver.tar.gz)
md5sums=('c4c5e6668a13a01bfb5ce562753a808f')

build() {
  export CFLAGS+=" -c -Wall"
  cd "$pkgname/src"
  make -e
}

package() {
  cd "$pkgname/src"
  install -d "$pkgdir"/usr/{bin,share/man/man1}
  make BINDIR="$pkgdir/usr/bin" MANDIR="$pkgdir/usr/share/man/man1" install
}
