pkgname=python-pyctr
pkgver=0.7.3
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
sha256sums=('d1d03f35cfe8b9e3370d6ffcf7153ae95d32ea0465a773095d555991e7a32221')
sha512sums=('d9ec95ebfc1cdb23c6f55b7f1f28964866a89c29d7535d8aa3fbab1bcab4e1491c5284e45cf89a851afd899dbc11883a6d99300e60bd5d1b540a5666e60ae831')

build() {
	cd pyctr-${pkgver}
	python setup.py build
}

package() {
	cd pyctr-${pkgver}
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
