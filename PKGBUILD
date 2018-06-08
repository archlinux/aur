# Maintainer : Vassilis Palassopoulos <palasso [at] gmail [dot] com>

pkgname=rkward
pkgver=0.7.0b
pkgrel=1
pkgdesc="An easy to use and easily extensible IDE/GUI for R"
url="http://rkward.kde.org/"
arch=('x86_64')
license=('GPL')
depends=('kdewebkit' 'ktexteditor' 'r')
makedepends=('kdoctools' 'extra-cmake-modules')
source=("http://download.kde.org/stable/rkward/${pkgver//b/}/src/rkward-$pkgver.tar.gz")
md5sums=('a678008a571c7dacd5c13d62817ead7a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DR_LIBDIR=/usr/lib/R/library
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
