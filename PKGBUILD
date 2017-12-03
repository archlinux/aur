# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $	
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=kvkbd
pkgver=0.7.2
pkgrel=2
pkgdesc="A virtual keyboard for KDE"
arch=(x86_64)
url="http://kde-apps.org/content/show.php/Kvkbd?content=56019"
license=(GPL)
depends=(kdebase-runtime)
makedepends=(cmake automoc4 docbook-xsl)
source=("http://kde-apps.org/CONTENT/content-files/56019-$pkgname-$pkgver.tar.gz")
md5sums=('26b0ed5fe3dfed0e885fce19676bf827')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
	-DQT_QMAKE_EXECUTABLE=qmake-qt4 \
	-DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
