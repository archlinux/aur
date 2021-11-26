# Contributor: Xyne <xyne at archlinux dot org>

pkgname=bindfs
pkgver=1.15.1
pkgrel=1
pkgdesc="A FUSE filesystem for mirroring a directory to another directory, similar to 'mount --bind', with permission settings."
arch=('i686' 'x86_64' 'armv6h' 'armv6l' 'armv7h')
url="http://bindfs.org/"
license=('GPL')
depends=('fuse')
source=("http://bindfs.org/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('da9003f141b7aa2c23651b3b836b1d979bf1b19915f307c05e40ae6906aab738036cc8b5df6caeec158e4fa6b7bca71489ea7884ff1607c6fea72a603a048d59')


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
