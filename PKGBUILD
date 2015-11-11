# Maintainer: basinilya <basinilya@gmail.com>
# Maintainer: TDY <tdy@gmx.com>

pkgname=xgrabcolor
pkgver=1.4.4
pkgrel=1
pkgdesc="A basic color picker"
arch=('i686' 'x86_64')
url="http://hugo.pereira.free.fr/software/index.php?page=package&package_list=software_list_qt4&package=xgrabcolor&full=0"
license=('GPL')
depends=('qt4')
makedepends=('cmake')
source=(http://hugo.pereira.free.fr/software/tgz/$pkgname-$pkgver.tar.gz)
options=(ccache)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  #export LDFLAGS="${LDFLAGS//--as-needed,}"
  cmake -D CMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

md5sums=('56119c8f8ff7e11d1b08b6feafb576de')
md5sums=('42ffd2bf01b0a18baa521d0c5e945ad0')
