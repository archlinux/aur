# Maintainer: Snaipe

pkgname=libcsptr
pkgver=2.0.4
pkgrel=1
pkgdesc="A smart pointers library for the C programming language"
arch=('i686' 'x86_64')
url="http://github.com/Snaipe/${pkgname}.git"
license=('MIT')
depends=('glibc')
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

md5sums=('f43cc18338952a69a79e9215033e4279')
