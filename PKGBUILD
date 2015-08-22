# Maintainer: Dennis Gosnell <cdep.illabout@gmail.com>
# Maintainer: SanskritFritz (gmail)

pkgname=libdockapp
pkgver=0.7.0
pkgrel=1
pkgdesc="Library that provides a framework for developing dockapps."
arch=('i686' 'x86_64')
url="http://windowmaker.org/dockapps/?name=libdockapp"
license=('GPL')
options=('!libtool')
depends=(libxpm)
source=("$pkgname-$pkgver.tar.gz::http://windowmaker.org/dockapps/?download=$pkgname-$pkgver.tar.gz")
md5sums=('SKIP')

build() {
  cd dockapps*
  autoreconf -fvi
  ./configure --prefix=/usr/ --without-examples --without-font
  make
}

package() {
  cd dockapps*
  make DESTDIR="$pkgdir/" install
}
