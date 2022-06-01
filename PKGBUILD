# guoyi
pkgname=bionj
pkgver=1997
pkgrel=1
pkgdesc="an improved version of the NJ algorithm based on a simple model of sequence data"
arch=('x86_64')
url="http://www.atgc-montpellier.fr/bionj/"
license=('GPL')
depends=('glibc')
makedepends=('gcc')
provides=('bionj')
install=${pkgname}.install
source=("http://www.atgc-montpellier.fr/download/sources/bionj/BIONJ.c")
sha256sums=('bb98da9f361785c3c99cc8bf420c404583a42d3ba4625051c8d3d68e166e1ab9')
build() {
  cd $srcdir
  gcc BIONJ.c -o $pkgname
}

package() {
  cd "$srcdir"
  chmod +x $pkgname
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
