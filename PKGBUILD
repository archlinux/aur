# Maintainer: Taekyung Kim <gnuykeat.mik@gmail.com>
# Maintainer: Jaseem Abid <jaseemabid@gmail.com>
# Maintainer: Diego Rosario <diegorosario2013@gmail.com>
# Maintainer: Thomas Hansen <thomas-e-hansen@teh6.eu>

pkgname=chez-scheme
pkgver=9.5.8
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
sha256sums=('af83e80cbfe1a9a7c868e7c069a40c449fadd5e2a1737fd0f1260fc9d4159906')
_archivename=csv$pkgver

build() {
  cd "$srcdir/${_archivename}"
  ./configure --installprefix=/usr --temproot=$pkgdir --threads --installschemename=chez --installscriptname=chez-script
}

package() {
  cd "${srcdir}/${_archivename}"
  make install DESTDIR="$pkgdir"
}
