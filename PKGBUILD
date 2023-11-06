# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>

pkgname=libspectrum-git
pkgver=1.6.0.1ec4c7
pkgrel=1
pkgdesc="ZX Spectrum emulator support library."
arch=('i686' 'x86_64')
url="http://fuse-emulator.sourceforge.net/libspectrum.php"
license=("GPL")
conflicts=("libspectrum")
depends=('libgcrypt' 'glib2' 'audiofile')
source=("libspectrum::git+https://git.code.sf.net/p/fuse-emulator/libspectrum")
md5sums=('SKIP')

build() {
  cd "$srcdir"/libspectrum
  ./autogen.sh
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "$srcdir"/libspectrum
  make DESTDIR="$pkgdir" install
}

