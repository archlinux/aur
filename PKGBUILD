# Maintainer:  gagnonlg NOSPAM protonmail NOSPAM com
pkgname=dd4hep
_pkgver=01-15
pkgver=$(echo $_pkgver | sed 's/-/./')
pkgrel=1
pkgdesc="Detector Description Toolkit for High Energy Physics"
arch=('x86_64')
url="https://dd4hep.web.cern.ch/dd4hep/"
license=('LGPL3')
depends=(boost-libs root)
makedepends=(boost cmake)
source=(https://github.com/AIDASoft/$_pkgname/archive/v$_pkgver.tar.gz)
md5sums=('6e28f8ddc798522ede04644fc45209bb')

build() {
  cd "$srcdir/DD4hep-$_pkgver"
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/DD4hep-$_pkgver/build"

  make DESTDIR="$pkgdir/" install
}
