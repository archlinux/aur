# Maintainer: Christopher Kobayashi <software+aur@disavowed.jp>
pkgname=python-adafruit_bbio-git
pkgver=1.1.2.r16.g7361d9a
pkgrel=1
pkgdesc="Adafruit's BeagleBone IO Python Library" 
url="https://github.com/adafruit/adafruit-beaglebone-io-python"
arch=('x86_64' 'armv7h')
license=('GPLv3')
depends=('python')
optdepends=()
makedepends=('git')
conflicts=()
replaces=()
backup=()
source=('git+https://github.com/adafruit/adafruit-beaglebone-io-python')

sha256sums=(
	'SKIP'
)

pkgver() {
	cd adafruit-beaglebone-io-python
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/adafruit-beaglebone-io-python"
	python setup.py install --root="$pkgdir/" --optimize=1
}
