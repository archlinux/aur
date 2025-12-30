# Maintainer: Ville Lautanala <lautis at gmail dot com>
pkgname=ruuvitag-listener-bin
pkgver=0.6.0
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

sha256sums_x86_64=('cc9f23f1ffe060f5a3c70c3ef42fc4cf7cb8e287444d85750b59e2449ad20eae')
sha256sums_armv7h=('ca69feba35ba3d39441528604267bb9eececbb2d32056a4952347a4edb17652c')
sha256sums_aarch64=('1aaf1f77ed14eac8abde7519a9dc9e366722d1050fcb2c85b0d12c9707fefd17')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
