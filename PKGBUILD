# Contributor: Xyne <xyne at archlinux dot us>

pkgname=bindfs
pkgver=1.13.6
pkgrel=1
pkgdesc="A FUSE filesystem for mirroring a directory to another directory, similar to 'mount --bind', with permission settings."
arch=('i686' 'x86_64' 'armv6h' 'armv6l' 'armv7h')
url="http://bindfs.org/"
license=('GPL')
depends=('fuse')
source=("http://bindfs.org/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d6c1845edc160419d50283995602cabff204b41d6116d89ffba4a7153482e803cacc45ae95e2e9b13c798b59a32aa4016a2b00cc51db1a5f6b720f09a97b87f1')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make CPUOPTIMIZATIONS="${CFLAGS}"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
