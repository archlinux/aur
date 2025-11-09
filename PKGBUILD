# Maintainer: White Owl <thetruewhiteowl@proton.me>
pkgname=python-adafruit-circuitpython-register
_name=adafruit_circuitpython_register
pkgver=1.11.1
pkgrel=1
pkgdesc="Library providing a variety of data descriptor class for Adafruit CircuitPython that makes it really simple to write device drivers for I2C and SPI register based devices."
arch=("any")
url="https://github.com/adafruit/Adafruit_CircuitPython_Register"
license=("MIT OR Unlicense OR CC-BY-4.0")

depends=("python")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools-scm")

source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=(45c6b6de5e65efe584375ea1bd6964866dab0d5e5b52ede49e906abd28876989)

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
