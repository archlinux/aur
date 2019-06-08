# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Ismo Toijala <ismo.toijala@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=minuit2
_PkgName=Minuit2
pkgver=5.34.14
_pkgver=5_34_14
pkgrel=2
pkgdesc="A physics analysis tool for function minimization"
arch=('x86_64')
url="http://lcgapp.cern.ch/project/cls/work-packages/mathlibs/minuit/"
license=('LGPL')
depends=('gcc-libs')
options=('!libtool')
source=("http://www.cern.ch/mathlibs/sw/$_pkgver/$_PkgName/$_PkgName-$pkgver.tar.gz")
sha256sums=('2ca9a283bbc315064c0a322bc4cb74c7e8fd51f9494f7856e5159d0a0aa8c356')

build() {
  cd $srcdir/$_PkgName-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$_PkgName-$pkgver
  make DESTDIR=$pkgdir install
}
