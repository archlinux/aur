# Maintainer: Craig <fast dot code dot studio at gmail dot com>

pkgname=aweather-git
provides=('aweather')
pkgver=0.9.0
pkgrel=1
pkgdesc="Free real-time weather data viewer designed for weather enthusiasts."
arch=('aarch64' 'x86_64')
url="http://pileus.org/aweather/"
license=('GPL3')
depends=("grits" 'mesa' 'rsl')
optdepends=('gpsd')
source=('git+https://github.com/i3Craig/aweather.git')
sha512sums=('SKIP')

prepare() {
  cd aweather
   ./configure --prefix=/usr LIBS=-lgthread-2.0
}

build() {
  cd aweather
  make
}

package() {
  cd aweather
  make DESTDIR="${pkgdir}" install
}
