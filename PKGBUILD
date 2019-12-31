# Contributor: Xyne <xyne at archlinux dot us>

pkgname=bindfs
pkgver=1.14.2
pkgrel=1
pkgdesc="A FUSE filesystem for mirroring a directory to another directory, similar to 'mount --bind', with permission settings."
arch=('i686' 'x86_64' 'armv6h' 'armv6l' 'armv7h')
url="http://bindfs.org/"
license=('GPL')
depends=('fuse')
source=("http://bindfs.org/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('ae29e9c484d00a0d71f53945d5d9db07ec354acc8b5c668d875b31fd0e74482454310ff9324df0bd74fcca9aafad280a8bd45fefa5496c8ade7488770e3f036f')


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
