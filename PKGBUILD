# Contributor: Ed Sandberg <scarypezsanta@gmail.com>
# Maintainer: Xyne

pkgname=abinit
pkgver=8.10.2
pkgrel=1
pkgdesc="Full-featured atomic-scale first-principles simulation software."
arch=('i686' 'x86_64')
url="https://www.abinit.org/"
license=('GPLv3')
depends=('lapack' 'blas' 'openmpi')
makedepends=('gcc-fortran' 'perl')
source=(
  "https://www.abinit.org/sites/default/files/packages/$pkgname-$pkgver.tar.gz"
)

build() {
  cd -- "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr #--disable-all-plugins
  make -j $(($(nproc) + 1))
}

package() {
  cd -- "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

sha512sums=('e4771647a1f6f89a8179891c8cfa534f552fb937b6e98fee0c49caa58a2dc894ee4a87e7c20003a508f255c6b259525cee0ac26465496402f026ac5cce5620db')
