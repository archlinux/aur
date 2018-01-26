#Maintainer:xgdgsc<xgdgsc@gmail.com>

pkgname=qtcreator-doxygen
pkgver=0.4.6
pkgrel=2
pkgdesc="Doxygen Plugin for Qt Creator"
url=https://github.com/fpoussin/qtcreator-doxygen
arch=(x86_64)
makedepends=("qtcreator-src")
depends=("qtcreator")
license=(MIT)
# _qtver=4.4.x

md5sums=('16f7716c27bbbf22ba329da92d00d6ed')

source=("https://github.com/fpoussin/qtcreator-doxygen/archive/v$pkgver.tar.gz")
build() {
  cd "$srcdir/$pkgname-$pkgver/"
   QTC_SOURCE=/usr/src/qtcreator QTC_BUILD=build qmake\
        "LIBS+=-L/usr/lib/qtcreator/ -L/usr/lib/qtcreator/plugins"
  make -j`nproc`
}

package() {
  cd "${srcdir}/$pkgname-$pkgver/"
  make INSTALL_ROOT="${pkgdir}/usr" install
}
