# Contributor: Xyne <xyne at archlinux dot us>

pkgname=bindfs
pkgver=1.14.1
pkgrel=1
pkgdesc="A FUSE filesystem for mirroring a directory to another directory, similar to 'mount --bind', with permission settings."
arch=('i686' 'x86_64' 'armv6h' 'armv6l' 'armv7h')
url="http://bindfs.org/"
license=('GPL')
depends=('fuse')
source=("http://bindfs.org/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a0cf4f2cff147f5496c15a9bd9634ccdee323e299a4b132f2c2166a9d5379a26a151a14a45aec6950f8cf9c7ac3e9d2b9a97fee60b3130f5dcb20d65a43a1702')


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
