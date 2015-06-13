# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=cube-perf
_version=4.3
_patch=.1
pkgver=${_version}${_patch}
pkgrel=1
pkgdesc="Performance report explorer for displaying a multi-dimensional performance space."
arch=('i686' 'x86_64')
url="http://www.scalasca.org/software/cube-4.x/download.html"
license=('BSD')
depends=('qt4')
source=(http://apps.fz-juelich.de/scalasca/releases/cube/${_version}/dist/cube-${pkgver}.tar.gz)
sha1sums=('5fa473a02a4aa37bf813e26f2b66066fccfb332f')
options=('!makeflags')

build() {
  cd "$srcdir/cube-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/cube-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
