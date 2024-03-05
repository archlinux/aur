pkgname=python-pyctr
pkgver=0.7.5
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
sha256sums=('e347e0c55432f2d9f1c17ba2cbea02206191d6148b98d3e648e5efd427a79adc')
sha512sums=('671367b3d8a1468857ec3cdcae4fb20e377559bb2c60295601b78261f0b6f459259b470989b92ac0be9a1fe1bc00a4f3267821e897992d2987adc5d9cd57b0cd')

build() {
	cd pyctr-${pkgver}
	python setup.py build
}

package() {
	cd pyctr-${pkgver}
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
