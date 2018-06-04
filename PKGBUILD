# Maintainer: Jonathan Steel <jsteel@aur.archlinux.org>
# Contributor: Peter Simons <simons@cryp.to>

pkgname=banner
pkgver=1.3.2
pkgrel=7
pkgdesc="Print large banners to ASCII terminals"
arch=('x86_64')
url="http://shh.thathost.com/pub-unix"
license=('GPL')
depends=('glibc')
makedepends=('shhmsg' 'shhopt')
conflicts=('sysvbanner')
source=($url/files/$pkgname-$pkgver.tar.gz)
md5sums=('9bd1dc58d3bced525a19194b92d20217')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  make OPTIM="$CFLAGS" dep
  make OPTIM="$CFLAGS"
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make INSTBASEDIR="$pkgdir"/usr/ INSTMANDIR="$pkgdir"/usr/share/man/man1/ install
}
