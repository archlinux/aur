# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=mclk.lv2
pkgver=0.2.1
pkgrel=1
pkgdesc="A MIDI clock and realtime-message generator LV2 plugin"
arch=('i686' 'x86_64')
url="https://github.com/x42/mclk.lv2"
license=('GPL2')
groups=('lv2-plugins')
makedepends=('lv2')
source=("${pkgname}-$pkgver.tar.gz::https://github.com/x42/${pkgname}/archive/v$pkgver.tar.gz")
md5sums=('635d3c02e2c5642acc446952ee196d09')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
