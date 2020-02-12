# Contributor: Xyne <xyne at archlinux dot us>

pkgname=bindfs
pkgver=1.14.3
pkgrel=1
pkgdesc="A FUSE filesystem for mirroring a directory to another directory, similar to 'mount --bind', with permission settings."
arch=('i686' 'x86_64' 'armv6h' 'armv6l' 'armv7h')
url="http://bindfs.org/"
license=('GPL')
depends=('fuse')
source=("http://bindfs.org/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('34a927a59cc0ab77ff12f49765831fa9c2ec0f9cbd1d1af517e8746a7aa7370aef011d5f29c9bce6f48aca9218b192fdd489451cd08179bbef7c287e126ebbba')


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
