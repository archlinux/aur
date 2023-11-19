# Maintainer: oldherl <oldherl@gmail.com>
# Contributor: Anatoly V. Beregovoy <avberegovoy@gmail.com>

pkgname=libpasastro
pkgver=1.4.2
pkgrel=1
_pkgver="v$pkgver"
pkgdesc="Provide Pascal interface for standard astronomy libraries"
arch=('x86_64')
url="http://www.sourceforge.net/projects/libpasastro/"
license=('GPL')
depends=('gcc-libs')
makedepends=('git')
options=()
source=("git+https://github.com/pchev/libpasastro.git#tag=$_pkgver")
sha256sums=('SKIP')

build() {
  cd $srcdir/$pkgname
  # fix: gcc complains if output directory does not exist
  mkdir -p plan404/obj
  make -j
}

package() {
  cd "$srcdir/$pkgname"
  make install PREFIX="$pkgdir/usr"
}

