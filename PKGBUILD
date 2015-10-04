# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-adafruit_dht
pkgver=0.0.1
pkgrel=2
pkgdesc="Python library to read the DHT series of humidity and temperature sensors on a Raspberry Pi or Beaglebone Black."
url="https://github.com/mala-zaba/Adafruit_Python_DHT"
arch=('armv5h' 'armv7h')
license=('GPLv3')
depends=('python' 'git')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=()
source=("git://github.com/mala-zaba/Adafruit_Python_DHT")
md5sums=('SKIP')

package() {
  cd "${srcdir}/Adafruit_Python_DHT"
  if [ "$(grep AM33 /proc/cpuinfo)" = "" ]; then
    python setup.py install --force-pi --root="$pkgdir/" --optimize=1
  else
    python setup.py install --force-bbb --root="$pkgdir/" --optimize=1
  fi
}

# vim:set ts=2 sw=2 et:
