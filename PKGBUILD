pkgname=python-pyctr
pkgver=0.7.4
pkgrel=1
pkgdesc="Python library to interact with Nintendo 3DS files"
arch=($CARCH)
license=('MIT')
url='https://github.com/ihaveamac/pyctr'
depends=('python>=3.8' 'python-pycryptodomex')
makedepends=('python-setuptools')
optdepends=('python-pillow: to convert SMDH icons to standard image formats')
options=(!strip)
source=("pyctr-${pkgver}.tar.gz::https://github.com/ihaveamac/pyctr/archive/v${pkgver}.tar.gz")
sha256sums=('6207fe4344494035a78f85222a0049a7ae56582b659a1ae33ac1d3d01d87a4d6')
sha512sums=('8d10284719f7adb2ac5a92beb3d2a5a09501939364a79430884c6f4a212b7a88789ef4b1fd28b171d041007365afb39f8b4e850a75b1bbf9c14eafe68d6f887c')

build() {
	cd pyctr-${pkgver}
	python setup.py build
}

package() {
	cd pyctr-${pkgver}
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
