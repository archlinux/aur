# Contributor: Xyne <xyne at archlinux dot us>

pkgname=bindfs
pkgver=1.13.0
pkgrel=1
pkgdesc="A FUSE filesystem for mirroring a directory to another directory, similar to 'mount --bind', with permission settings."
arch=('i686' 'x86_64')
url="http://bindfs.org/"
license=('GPL')
depends=('fuse')
source=("http://bindfs.org/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('354f3ad025e5d37afff68a871e99e11e12d203ba8f61e031a3f6076bcc41a6888cd685223880ce724fd44ae4c206728cda802be86b5599f258fbbb1284504158')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make CPUOPTIMIZATIONS="${CFLAGS}"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
