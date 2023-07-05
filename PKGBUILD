pkgname=esptool3.2
_pkgname=esptool
pkgver=3.2
pkgrel=2
pkgdesc="A cute Python utility to communicate with the ROM bootloader in Espressif ESP8266"
arch=('any')
url="https://github.com/espressif/esptool"
license=('GPL2')
makedepends=('git' 'python-setuptools' 'python-pip')
depends=('python-pyserial' 'python-ecdsa' 'python-pyaes' 'python-bitstring' 'python-reedsolo')
source=("https://github.com/espressif/esptool/archive/v${pkgver}.tar.gz")
sha512sums=('5e67b3a17190e051d7706ee2dbbe855488765a7bfed15b15f5a04022c3fbf19112905ba6a672c37b1bac5501d45d477cfff07c004cd83b2d1a111430992cefc1')
provides=('esptool=3.2')
conflicts=('esptool')

build() {
  cd "${_pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
