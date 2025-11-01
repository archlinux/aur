pkgname=postgresql-debversion
pkgver=1.2.0
pkgrel=3
pkgdesc="Debian version number type for PostgreSQL"
arch=('x86_64')
url="https://packages.debian.org/source/sid/postgresql-debversion"
license=('GPL3')
makedepends=('clang' 'llvm')
depends=('postgresql>18' 'postgresql<19' 'apt')
source=("https://deb.debian.org/debian/pool/main/p/${pkgname}/${pkgname}_${pkgver}.orig.tar.bz2")
b2sums=('8d05c94a7a534454c143831a9df6361899a80e5491ecfc6e4921845c297a4324f81c8534668f796b316172e491ae9eb359cc2908e5e9e22668b50e3afaabd4b2')

build() {
  cd "$pkgname-v$pkgver"

  make CC=clang CXX=clang++
}

package() {
  cd "$pkgname-v$pkgver"

  make DESTDIR="$pkgdir" install
}
