# Maintainer: Jorai Rijsdijk <aur@jrijsdijk.com>

pkgname=mcrl2
pkgver=202407.1
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
sha256sums=('5613fd0454ae8f160c71056ee8fea4eb2887d94521081dcff8f8fef48afbc7ab')
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
