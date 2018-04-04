# Maintainer: Josh Marshall <jrmarsha@mtu.edu>

pkgname=ncoils
pkgver='2.2.1'
pkgrel=1
pkgdesc="Rob Russell's attempt to make a COILS program"
arch=('x86_64')
license=('GPL')
url='http://www.russelllab.org'
depends=('glibc')
makedepends=('gcc-libs')
provides=()
path='/coils'
source=(
	"$url$path/coils.tar.gz"
)
sha512sums=(
'd10f2bfd7d8ea9062c49a805553c4109e06467fbe0f73c44b67ddf9f3224652112b46d6cfefdf29c1fea0505c732acf5e6bf7b30f90a7ec59a8cbbdc6422d829'
)


build() {
  cd coils
  cc -O2 -march=native -pipe -I. -o ncoils ncoils.c read_matrix.c -lm
}

package() {  
  cd coils
  install -D ncoils "$pkgdir/usr/bin/ncoils"
}
