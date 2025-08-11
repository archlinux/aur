# Maintainer: Jorai Rijsdijk <aur@jrijsdijk.com>

pkgname=mcrl2
pkgver=202507.0
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
sha256sums=('52bec61976d8bd59ab114abf093472b9534b0c729f16b6072626e8d09bd88723')
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
