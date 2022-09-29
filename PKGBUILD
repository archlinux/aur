# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-weatherrouting
pkgver=1.13.49
pkgrel=1
pkgdesc="Weather routing plugin for OpenCPN"
arch=('x86_64' 'aarch64')
license=("GPL3" "CCPL:by")
depends=('opencpn')
makedepends=('cmake' 'git')
url="https://opencpn.org/OpenCPN/plugins/weatherroute.html"
source=("$pkgname::git+https://github.com/rgleason/weather_routing_pi.git#commit=dd333323acc3b3a23bd8483c0ffaeee6427ee5f0")
b2sums=('SKIP')

build() {
  cd $pkgname
  mkdir -p build
  cd build
  BUILD_GTK3=TRUE cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$pkgname/build"
  DESTDIR="$pkgdir" make install
}
