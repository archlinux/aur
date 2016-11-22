
pkgname=cadna_c
pkgver=2.0.0
pkgrel=1
pkgdesc="Control of Accuracy and Debugging for Numerical Applications)"
arch=('i686' 'x86_64')
url="http://www-pequan.lip6.fr/cadna/index.php"
license=('LGPL')
depends=('gcc-libs')
makedepends=()
source=("http://www-pequan.lip6.fr/cadna/Download_Dir/cadna_c-${pkgver}.tar.gz")
sha256sums=('7109f8c58f90568204d2483fa81327858e5eb037a86293cd2970f8a68ba95fea')

build() {
  cd "$srcdir"/cadna_c-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/cadna_c-${pkgver}
  make install DESTDIR="$pkgdir"
}
