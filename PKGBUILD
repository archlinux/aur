# Maintainer: Artyom Melnikov <a@arti-nt.ru>
pkgname=esp-idf
pkgver=3.3
pkgrel=1
pkgdesc="Espressif IoT Development Framework. Official development framework for ESP32."
arch=('i686' 'x86_64' 'aarch' 'aarch64' 'armv7h')
url="https://github.com/espressif/esp-idf"
license=('APACHE')
depends=('python' 'python-click' 'python-pyserial' 'python-future' 'python-cryptography' 'python-pyparsing' 'python-pyelftools')
install='esp-idf.install'
source=(https://github.com/espressif/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.zip)
sha256sums=('9d8dda75f6fb4695ddeaca92d47e640f49ea3df06ad0696961978d49416b1632')

build() {
  cd "$srcdir/${pkgname}-v${pkgver}"
	git submodule update --init
}

package() {
  mkdir -p ${pkgdir}/opt/esp-idf
  cd "${srcdir}/${pkgname}-v${pkgver}"
  msg "Installing to /opt/esp-idf"
  cp -R . ${pkgdir}/opt/esp-idf
}
