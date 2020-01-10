# Maintainer: Artyom Melnikov <a@arti-nt.ru>
pkgname=esp-idf
pkgver=3.3.1
pkgrel=1
pkgdesc="Espressif IoT Development Framework. Official development framework for ESP32."
arch=('i686' 'x86_64' 'aarch' 'aarch64' 'armv7h')
url="https://github.com/espressif/esp-idf"
license=('APACHE')
depends=('python' 'python-click' 'python-pyserial' 'python-future' 'python-cryptography' 'python-pyparsing' 'python-pyelftools')
install='esp-idf.install'
source=(https://github.com/espressif/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.zip)
sha256sums=('010465a10b28c80abf09059b8a49fa7390cb2ce99e83d1de6328e7c1d7728ad3')

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
