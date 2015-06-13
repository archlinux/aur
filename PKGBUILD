# Contributor: TDY <tdy@gmx.com>
# Maintainer: SanskritFritz (gmail)

pkgname=transparency
pkgver=2.7.4
pkgrel=1
pkgdesc="A transparent application suite with clock, calendar, and system load applets."
arch=('i686' 'x86_64')
url="http://hugo.pereira.free.fr/software/index.php?page=package&package_list=software_list_qt4&package=transparency&full=0"
license=('GPL')
depends=('qt4')
makedepends=('cmake')
source=("http://hugo.pereira.free.fr/software/tgz/$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

md5sums=('a0181920032f97d7c71afa91fe309ba8')
