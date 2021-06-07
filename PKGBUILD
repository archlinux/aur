# Maintainer: Aditya Naik <nikeadilfc at gmail dot com>
# Contributor: William J. Bowman <aur@williamjbowman.com>

pkgname=mathcomp
pkgver=1.12.0
pkgrel=1
pkgdesc="The entire mathematical components library for Coq."
url="https://math-comp.github.io/math-comp/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('coq>=8.10')
source=(mathcomp-$pkgver.tar.gz::https://github.com/math-comp/math-comp/tarball/mathcomp-$pkgver)
sha256sums=('2bb92d06235d6f91c8a7655602949aa6a0e70522b5759f87636e4bd26dc8c69d')
sha512sums=('d8ab930587e0716b85d86fedd2e16fd29a74a5b6a7a0d4c70f27a3a94bf8fad016e0d6d962147db6a1c39cf5083219eab67759bba55047a07c250988a9d052a6')
conflicts=('ssreflect')

build() {
  cd $srcdir/math-comp-math-comp-*/$pkgname

  make
}

package(){
  cd $srcdir/math-comp-math-comp-*/$pkgname
  make DSTROOT="${pkgdir}" install
}

