# Maintainer: Taekyung Kim <gnuykeat.mik@gmail.com>
# Maintainer: Jaseem Abid <jaseemabid@gmail.com>
# Maintainer: Diego Rosario <diegorosario2013@gmail.com>
# Maintainer: Thomas Hansen <thomas-e-hansen@teh6.eu>

pkgname=chez-scheme
pkgver=9.6.2
pkgrel=1
pkgdesc="Compiler and run-time system for the language of the Revised^6 Report on Scheme (R6RS), with numerous extensions."
arch=(i686 x86_64)
url="https://github.com/cisco/ChezScheme"
depends=()
license=('Apache')
depends=('ncurses' 'libx11' 'libutil-linux')
conflicts=('petite-chez-scheme' 'chez-scheme-git')
replaces=('petite-chez-scheme' 'chez-scheme-git')
source=("https://github.com/cisco/ChezScheme/releases/download/v$pkgver/csv$pkgver.tar.gz")
sha256sums=('714695789e1bad3518e6cd5fbc8ae8204f76103d5ad2ba05a3f1c063eb2d5d02')
_archivename=csv$pkgver

build() {
  cd "$srcdir/${_archivename}"
  ./configure --installprefix=/usr --temproot=$pkgdir --threads --installschemename=chez --installscriptname=chez-script
}

package() {
  cd "${srcdir}/${_archivename}"
  make install DESTDIR="$pkgdir"
}
