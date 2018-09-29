# Maintainer: Gonçalo Camelo Neves Pereira <goncalo_pereira@outlook.pt>
pkgname=esp-idf
pkgver=3.1
pkgrel=3
pkgdesc="Espressif IoT Development Framework. Official development framework for ESP32."
arch=('i686' 'x86_64' 'aarch' 'aarch64' 'armv7h')
url="https://github.com/espressif/esp-idf"
license=('APACHE')
depends=('gcc' 'git' 'make' 'ncurses' 'flex' 'bison' 'gperf' 'python2-pyserial')
source=(https://github.com/espressif/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.zip)
sha256sums=('SKIP')

build() {
  cd "$srcdir/${pkgname}-v${pkgver}"
	git submodule update --init
}

package() {
  mkdir -p ${pkgdir}/opt/esp-idf-sdk
  cd "${srcdir}/${pkgname}-v${pkgver}"
  msg "Installing to ~/.esp-idf"
  cp -R . ${pkgdir}/opt/esp-idf-sdk
}
