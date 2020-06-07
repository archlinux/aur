# Maintainer: Artyom Melnikov <a@arti-nt.ru>
pkgname=esp-idf
pkgver=4.0.1
pkgrel=1
pkgdesc="Espressif IoT Development Framework. Official development framework for ESP32."
arch=('i686' 'x86_64' 'aarch' 'aarch64' 'armv7h')
url="https://github.com/espressif/esp-idf"
license=('APACHE')
depends=('python' 'python-click' 'python-pyserial' 'python-future' 'python-cryptography' 'python-pyparsing' 'python-pyelftools')
makedepends=('git')
install='esp-idf.install'
source=(https://github.com/espressif/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.zip)
sha512sums=('f184c4cd0d682a040f89af5617d1ff60d76eaf20eb4aca3d9cd234de6538287276ee6fc724ed21e253a03ab74658601d5093e7dd088a42c129499034f80eb1b1')

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
