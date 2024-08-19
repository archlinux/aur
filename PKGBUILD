# Maintainer: Jorai Rijsdijk <aur@jrijsdijk.com>

pkgname=mcrl2
pkgver=202407.0
pkgrel=1
pkgdesc="A formal specification language with an associated toolset."
arch=('i686' 'x86_64')
provides=('mcrl2')
conflicts=('mcrl2')
depends=('qt6-base' 'glu' 'hicolor-icon-theme')
optdepends=('python: for easily running the included examples')
makedepends=('boost' 'cmake' 'gcc>=7.0')
url=http://www.mcrl2.org
license=('Boost')
source=("http://mcrl2.org/download/release/$pkgname-$pkgver.tar.gz")
sha256sums=('dda2155486519ae43ccaae823dfc0021b2b958662507f76ddb7717b30e9549e6')
install=mcrl2.install

build() {
  cd $srcdir/$pkgname-$pkgver
  cmake -DCMAKE_INSTALL_RPATH=/usr/lib/mcrl2 .
  make $MAKEFLAGS
}

package() {
  cd $srcdir/$pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr -P cmake_install.cmake
}
