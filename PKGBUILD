# Maintainer: Ville Lautanala <lautis at gmail dot com>
pkgname=ruuvitag-listener-bin
pkgver=0.7.0
pkgrel=1
pkgdesc='Listen to RuuviTag Bluetooth LE sensor measurements and output using InfluxDB line protocol.'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/lautis/ruuvitag-listener' 
license=('MIT')
provides=('ruuvitag-listener')
conflicts=('ruuvitag-listener')
install='ruuvitag-listener-bin.install'
depends=('bluez' 'dbus')

source_x86_64=("https://github.com/lautis/ruuvitag-listener/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/lautis/ruuvitag-listener/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("https://github.com/lautis/ruuvitag-listener/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz")

sha256sums_x86_64=('c5170f54786cdbf01050fd33b28414ab54f961cb7f96479cfeda11d0b9bbb854')
sha256sums_armv7h=('eb976cbf08e184b4ea5d8bae7c28684e203e1b7d0d7fd5bb568d2f8d0d73027f')
sha256sums_aarch64=('43d3bd9cd1fb44412f746e5153998c2338e7d2b7432cb150fcce143ecbd98c1a')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
