# Maintainer: Kevin Brodsky <corax26 at gmail dot com>
# Contributor: Anton Jongsma <anton@felrood.nl>
pkgname=flexc++
pkgver=2.03.01
pkgrel=1
pkgdesc="C++ scanner generator"
arch=('i686' 'x86_64')
url="https://fbb-git.github.io/flexcpp/"
license=('GPL')
# Versions taken from the 'required' file in sources
depends=('libbobcat>=4.01.00')
makedepends=('icmake>=7.22.00' 'yodl>=3.05.00')
optdepends=()
source=("https://github.com/fbb-git/flexcpp/archive/${pkgver}.tar.gz")
md5sums=('ca103fb92e9b94b0354783670473ec75')

build() {
  cd "$srcdir/flexcpp-${pkgver}/flexc++"

  CXXFLAGS="$CXXFLAGS --std=c++11"
  ./build program
  ./build man
  ./build manual
}

package() {
  cd "$srcdir/flexcpp-${pkgver}/flexc++"
  ./build install program "${pkgdir}/usr/bin/flexc++"
  ./build install skel "${pkgdir}/usr/share/flexc++"
  ./build install man "${pkgdir}/usr/share/man"
  ./build install manual "${pkgdir}/usr/share/doc/flexc++"
  ./build install std "${pkgdir}/usr/share/doc/flexc++"
}
