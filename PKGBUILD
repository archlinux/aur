# Maintainer: jmcb <joelsgp@protonmail.com>

_name=adafruit-board-toolkit
pkgname=python-$_name
pkgver=1.1.0
pkgrel=1
pkgdesc="CircuitPython board identification and information"
arch=('any')
url="https://github.com/adafruit/Adafruit_Board_Toolkit"
license=('MIT')
depends=('python' 'python-pyserial')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('61e19c30854764230138f4c1d65bf3b5d6ef22866396b231df7123a5a2507f27')


build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1

}
