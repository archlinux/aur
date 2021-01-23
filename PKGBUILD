# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: Spike29 <leguen.yannick@gmail.com>

pkgname=plasma5-applets-places-widget
pkgver=1.4
pkgrel=1
pkgdesc="Plasma 5 widget that gives access to user places"
arch=(any)
url="https://github.com/HessiJames/plasma-applet-places-widget"
license=(GPL2)
depends=(plasma-workspace plasma-framework)
makedepends=(extra-cmake-modules)
source=("https://github.com/HessiJames/plasma-applet-places-widget/archive/v${pkgver}.tar.gz")
md5sums=('7274836af80ad179df9a85480eac407c')

prepare() {
  mkdir -p "$srcdir"/plasma-applet-places-widget-${pkgver}/build
}

build() {
  cd "$srcdir"/plasma-applet-places-widget-${pkgver}/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir"/plasma-applet-places-widget-${pkgver}/build
  make DESTDIR="$pkgdir" install
}
