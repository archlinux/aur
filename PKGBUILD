# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>
pkgname=notably
pkgver=0.4
pkgrel=2
pkgdesc="A semantic note taking application based on the Nepomuk framework"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/base/notably"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4')
optdepends=()
install=
source=("$pkgname-$pkgver.tar.gz::http://quickgit.kde.org/index.php?p=notably.git&a=snapshot&h=8b6896bf0af409199ab14efde818e37594138366&fmt=tgz")
md5sums=('4f4268795320ad98be471c0d6f4641f6')

build() {
  cd "$srcdir/$pkgname"
  mkdir build
  cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir" install
}
