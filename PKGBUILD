# Maintainer: Artyom Melnikov <a@arti-nt.ru>
pkgname=esp-idf
pkgver=3.2.2
pkgrel=1
pkgdesc="Espressif IoT Development Framework. Official development framework for ESP32."
arch=('i686' 'x86_64' 'aarch' 'aarch64' 'armv7h')
url="https://github.com/espressif/esp-idf"
license=('APACHE')
depends=('python' 'python-click' 'python-pyserial' 'python-future' 'python-cryptography' 'python-pyparsing' 'python-pyelftools')
source=(https://github.com/espressif/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.zip)
sha256sums=('b4be7b9f3827868267299467ee86873b2bfdff19b5bb0cc27cf772a0708846bc')

build() {
  cd "$srcdir/${pkgname}-v${pkgver}"
	git submodule update --init
}

package() {
  mkdir -p ${pkgdir}/opt/esp-idf-sdk
  cd "${srcdir}/${pkgname}-v${pkgver}"
  msg "Installing to /opt/esp-idf"
  cp -R . ${pkgdir}/opt/esp-idf-sdk
}
