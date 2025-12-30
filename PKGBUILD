# Maintainer: Ville Lautanala <lautis at gmail dot com>
pkgname=ruuvitag-listener-bin
pkgver=0.6.1
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

sha256sums_x86_64=('807e224de93fdf8039cd87ce9528c744f3fece9ae8ef68da47ad9afb44b8e1b3')
sha256sums_armv7h=('a07c10c89a2ca0ff5891d9fa58251a9d668434a96ec87ba2f04664710431fc7b')
sha256sums_aarch64=('ba012b229e62a9e3c06a334b694e3fc7ca020bc9fc4d35af284d4077c44117c4')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
