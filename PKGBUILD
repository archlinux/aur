# Maintainer: Snaipe

pkgname=criterion
_archivename=Criterion
pkgver=2.1.0
pkgrel=1
pkgdesc="A KISS, non-intrusive unit testing framework for C and C++"
arch=('i686' 'x86_64')
url="http://github.com/Snaipe/${_archivename}.git"
license=('MIT')
depends=('glibc' 'pcre' 'gettext')
source=("https://github.com/Snaipe/${_archivename}/archive/v${pkgver}.tar.gz")

build() {
  cd ${srcdir}/${_archivename}-${pkgver}
  mkdir -p "build"
  cd "build"
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd ${srcdir}/${_archivename}-${pkgver}/build
  make DESTDIR=$pkgdir LIBDIR=$pkgdir/usr/lib install
}

md5sums=('0d9a3963fb65ab87a8c42d2f5c75a9c6')
