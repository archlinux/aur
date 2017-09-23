# Contributor: Xyne <xyne at archlinux dot us>

pkgname=bindfs
pkgver=1.13.7
pkgrel=2
pkgdesc="A FUSE filesystem for mirroring a directory to another directory, similar to 'mount --bind', with permission settings."
arch=('i686' 'x86_64' 'armv6h' 'armv6l' 'armv7h')
url="http://bindfs.org/"
license=('GPL')
depends=('fuse')
source=("http://bindfs.org/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('720fa089dac56b316240c1c8ee3958961d82dee6788b272ec9b22c222d28d03695f9ab8c35759f303298afb5c04da58e20214dbd9147cbf414a6a9c3e5882712')


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
