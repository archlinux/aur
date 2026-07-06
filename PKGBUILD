# Maintainer: Ville Lautanala <lautis at gmail dot com>
pkgname=ruuvitag-listener-bin
pkgver=0.8.0
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

sha256sums_x86_64=('1dee788ed1e5f1feef45859599f9bbd62a964acf79f35663dd5ff9788eba028f')
sha256sums_armv7h=('f952ae65ae7d453afd337c9af19147f72055745e59b35e19492130130fac6394')
sha256sums_aarch64=('36fa791eb88ee7a5be73cadbbc020b94041e6d9088b590cabc509c6f1121d909')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
