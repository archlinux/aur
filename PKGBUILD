# Contributor: Xyne <xyne at archlinux dot us>

pkgname=bindfs
pkgver=1.14.7
pkgrel=1
pkgdesc="A FUSE filesystem for mirroring a directory to another directory, similar to 'mount --bind', with permission settings."
arch=('i686' 'x86_64' 'armv6h' 'armv6l' 'armv7h')
url="http://bindfs.org/"
license=('GPL')
depends=('fuse')
source=("http://bindfs.org/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('03b0bce29b87219e7e159077942e66e7e0e783b8c41234231696f96aa83e66271431fd3b4e7c1d98ba74705ec7255bd7da9d9484981ddb86c4d1c1b35dcaa0cc')


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
