# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='pid-tools'
pkgdesc="Some commandline tools for dealing with pids, information about processes, and their relations"
pkgver=4.0.0
pkgrel=2
arch=('any')
license=('GPLv2')
url="http://github.com/kata198/pid-tools"
makedepends=('gcc' 'make')
source=("https://github.com/kata198/pid-tools/archive/${pkgver}.tar.gz")
sha512sums=("2c2d1734cfd15a1e76c93a706ad19cf5d923c4aec5b4e435c61fa3f6c4fe8df314937c4afff8641e947def515a92bd7a6ee31e2c3211523e2c6165fb39a61c47")

build() {
  cd "$srcdir/${pkgname}-$pkgver"

  make
}

package() {
  cd "${pkgname}-$pkgver"

  # Bug in MAKEFILE, have to end DESTDIR with /usr
  make install DESTDIR="${pkgdir}/usr" PREFIX="/"
}

