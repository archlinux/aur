# Contributor: bender02 at archlinux dot us
# Maintainer: SanskritFritz (gmail)

pkgname=libspectrum
pkgver=1.5.0
pkgrel=1
pkgdesc="ZX Spectrum emulator support library."
arch=('i686' 'x86_64')
url="http://fuse-emulator.sourceforge.net/libspectrum.php"
license=("GPL")
depends=('libgcrypt' 'glib2' 'audiofile')
source=("http://downloads.sourceforge.net/sourceforge/fuse-emulator/$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
md5sums=('a675e8b812f6029e6f7c780f8461b254')
