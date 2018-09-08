# Contributor: Ed Sandberg <scarypezsanta@gmail.com>
# Maintainer: Xyne

pkgname=abinit
pkgver=8.8.3
pkgrel=2
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

sha512sums=('775b4d79d61d1465d8e29e41f19a3283c9c42432ab093f77a8daf81e74a35f9addbacce5f177690bf4e3d8599859f9e2a37810c316336fb29f9826dc4bec8313')
