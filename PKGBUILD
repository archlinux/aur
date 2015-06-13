# Contributor: bender02 at archlinux dot us
# Maintainer: SanskritFritz (gmail)

pkgname=libspectrum
pkgver=1.1.1
pkgrel=2
pkgdesc="ZX Spectrum emulator support library"
arch=('i686' 'x86_64')
url="http://fuse-emulator.sourceforge.net/libspectrum.php"
license=("GPL")
depends=('bzip2' 'zlib' 'libgcrypt' 'glib2' 'audiofile')
source=(http://downloads.sourceforge.net/sourceforge/fuse-emulator/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
md5sums=('1bf15e02fe6c29c6247738c7aadbb1df')
