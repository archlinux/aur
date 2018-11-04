# Contributor: Xyne <xyne at archlinux dot us>

pkgname=bindfs
pkgver=1.13.10
pkgrel=1
pkgdesc="A FUSE filesystem for mirroring a directory to another directory, similar to 'mount --bind', with permission settings."
arch=('i686' 'x86_64' 'armv6h' 'armv6l' 'armv7h')
url="http://bindfs.org/"
license=('GPL')
depends=('fuse')
source=("http://bindfs.org/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0fcd07e412ce2a355310cc2eda4e005d045ac2c1744353eca118c921f647d4fc16d98269fd1e9d8bdc225602a915b2893746da77ae28c9cd07fa4eab0e03f4c7')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make CPUOPTIMIZATIONS="${CFLAGS}"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
