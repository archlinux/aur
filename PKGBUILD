pkgname=python-adafruit-circuitpython-register
_name=adafruit_circuitpython_register
pkgver=1.10.2
pkgrel=1
pkgdesc="Library providing a variety of data descriptor class for Adafruit CircuitPython that makes it really simple to write device drivers for I2C and SPI register based devices."
arch=("any")
url="https://github.com/adafruit/Adafruit_CircuitPython_Register"
license=("MIT OR Unlicense OR CC-BY-4.0")

depends=("python")
makedepends=("python-build" "python-installer" "python-wheel")

source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=(68e1899351b186f007b26326d01e4c5ed68187b50c059e1e414b53248f80053d)

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
