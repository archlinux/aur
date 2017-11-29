# Maintainer: Snaipe

pkgname=libcsptr
pkgver=2.0.4
pkgrel=2
pkgdesc="A smart pointers library for the C programming language"
arch=('i686' 'x86_64')
url="http://github.com/Snaipe/${pkgname}.git"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/Snaipe/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p "build"
  cd "build"
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR=$pkgdir LIBDIR=$pkgdir/usr/lib install
}

md5sums=('f55ff517219883f07e748fdc2fc084ed')
