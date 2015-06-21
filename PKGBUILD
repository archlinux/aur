# Contributor: Ed Sandberg <scarypezsanta@gmail.com>
# Maintainer: Xyne

pkgname=abinit
pkgver=7.4.2
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

md5sums=('5755fbb98c419d2a460fae222967646b')
sha256sums=('26fcc60e18071b7579843f43cbe44e79db50466dbaae8b862ad96a8986733f63')
