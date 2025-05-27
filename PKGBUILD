# Maintainer: Taekyung Kim <gnuykeat.mik@gmail.com>
# Maintainer: Jaseem Abid <jaseemabid@gmail.com>
# Maintainer: Diego Rosario <diegorosario2013@gmail.com>
# Maintainer: Thomas E. Hansen <thomas-e-hansen@teh6.eu>

pkgname=chez-scheme
pkgver=10.2.0
pkgrel=1
pkgdesc="Compiler and run-time system for the language of the Revised^6 Report on Scheme (R6RS), with numerous extensions."
arch=(i686 x86_64 aarch64)
url="https://github.com/cisco/ChezScheme"
depends=()
license=('Apache-2.0')
depends=('ncurses' 'libx11' 'libutil-linux')
conflicts=('petite-chez-scheme' 'chez-scheme-git')
source=("https://github.com/cisco/ChezScheme/releases/download/v$pkgver/csv$pkgver.tar.gz")
sha256sums=('b795916d4cfed59240c5f44b1b507a8657efd28e62e72e134d03486e9f3e374a')
_archivename=csv$pkgver

build() {
  cd "$srcdir/${_archivename}"
  ./configure --installprefix=/usr --temproot=$pkgdir --threads --installschemename=chez --installscriptname=chez-script --kernelobj
  make
}

package() {
  cd "${srcdir}/${_archivename}"
  make install DESTDIR="$pkgdir"
}
