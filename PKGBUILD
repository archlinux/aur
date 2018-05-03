# Maintainer: William J. Bowman <aur@williamjbowman.com>

pkgname=mathcomp
pkgver=1.7.0
pkgrel=1
# sigh. they rename the folder based on the commit hash, and glob matching can cause errors
_pkgcommitid=591c3e4
pkgdesc="The entire mathematical components library for Coq."
url="https://math-comp.github.io/math-comp/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('coq>=8.6' 'coq<=8.8')
source=(mathcomp-$pkgver.tar.gz::https://github.com/math-comp/math-comp/tarball/mathcomp-$pkgver)
sha256sums=('2d30a244769f3c7d628bff2f9118df935cd99dad774842b0e9d35bafdb3e02ea')
sha512sums=('332f79e97cc3a0fe72cff7e96080c34d5de11ff2c86bf1f4ed4953457cb3cd36795502e4fed24dec698492419076acd97571c154d946ba91b02ad27389423a61')

build() {
  cd $srcdir/math-comp-math-comp-${_pkgcommitid}/$pkgname

  # Per recommendations from README, use -j 3
  make -j 3
}

package(){
  cd $srcdir/math-comp-math-comp-${_pkgcommitid}/$pkgname
  make DSTROOT="${pkgdir}" install
}

