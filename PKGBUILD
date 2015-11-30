# Contributor: Ed Sandberg <scarypezsanta@gmail.com>
# Maintainer: Xyne

pkgname=abinit
pkgver=7.10.5
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

md5sums=('276db3ebad3f57952952b5235e5813cc')
sha256sums=('e9376a3e34790bce90992f28e5fa8554b51ba467bf5709c7fd25d300e7c4f56a')
