# Maintainer: Taekyung Kim <gnuykeat.mik@gmail.com>
# Maintainer: Jaseem Abid <jaseemabid@gmail.com>
# Maintainer: Diego Rosario <diegorosario2013@gmail.com>
# Maintainer: Thomas Hansen <thomas-e-hansen@teh6.eu>

pkgname=chez-scheme
pkgver=10.1.0
pkgrel=1
pkgdesc="Compiler and run-time system for the language of the Revised^6 Report on Scheme (R6RS), with numerous extensions."
arch=(i686 x86_64 aarch64)
url="https://github.com/cisco/ChezScheme"
depends=()
license=('Apache-2.0')
depends=('ncurses' 'libx11' 'libutil-linux')
conflicts=('petite-chez-scheme' 'chez-scheme-git')
replaces=('petite-chez-scheme' 'chez-scheme-git')
source=("https://github.com/cisco/ChezScheme/releases/download/v$pkgver/csv$pkgver.tar.gz")
sha256sums=('9181a6c8c4ab5e5d32d879ff159d335a50d4f8b388611ae22a263e932c35398b')
_archivename=csv$pkgver

build() {
  cd "$srcdir/${_archivename}"
  ./configure --installprefix=/usr --temproot=$pkgdir --threads --installschemename=chez --installscriptname=chez-script
  make
}

package() {
  cd "${srcdir}/${_archivename}"
  make install DESTDIR="$pkgdir"
}
