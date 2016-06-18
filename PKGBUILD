# Contributor: Ed Sandberg <scarypezsanta@gmail.com>
# Maintainer: Xyne

pkgname=abinit
pkgver=8.0.7
pkgrel=1
pkgdesc="Full-featured atomic-scale first-principles simulation software."
arch=('i686' 'x86_64')
url="http://www.abinit.org"
license=('GPLv3')
depends=('lapack' 'blas' 'openmpi' 'atompaw')
makedepends=('gcc-fortran' 'perl')
source=(http://ftp.abinit.org/${pkgname}-${pkgver}.tar.gz)

build() {
  cd -- "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr #--disable-all-plugins
  make
}

package() {
  cd -- "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

md5sums=('90797b01b7c67d87e6024bb4994d477c')
sha256sums=('9df2fe572af39cef937a4134d569321b99c6670f187edbac9b355ff2defd5afc')
