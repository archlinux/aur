# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-adafruit_dht
_pypi_pkgname=Adafruit_DHT
pkgver=1.3.4
pkgrel=0
pkgdesc="Python library to read the DHT series of humidity and temperature sensors on a Raspberry Pi or Beaglebone Black."
url="https://github.com/adafruit/Adafruit_Python_DHT"
arch=('armv6h' 'armv7h')
license=('GPLv3')
depends=('python')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=()
source=("https://pypi.io/packages/source/A/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('7af8a7683a5e45c715dc373bbdf6d23f50195b159948fde7c6c37f2add0cab82')

package() {
  cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
  if [ "$(grep AM33 /proc/cpuinfo)" = "" ]; then
    python setup.py install --force-pi2 --root="$pkgdir/" --optimize=1
  else
    python setup.py install --force-bbb --root="$pkgdir/" --optimize=1
  fi
}

# vim:set ts=2 sw=2 et:
