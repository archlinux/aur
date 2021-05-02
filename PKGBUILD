pkgname=python-pyctr
pkgver=0.4.7
pkgrel=1
pkgdesc="Python library to interact with Nintendo 3DS files"
arch=($CARCH)
license=('MIT')
url='https://github.com/ihaveamac/pyctr'
depends=('python' 'python-pycryptodomex')
makedepends=('python-setuptools')
options=(!strip)
source=("pyctr-${pkgver}.tar.gz::https://github.com/ihaveamac/pyctr/archive/v${pkgver}.tar.gz")
sha256sums=('89622fec720f2f64f46e742db1ddb4fce7764247c3ccc5b5c5fecf4084bd0f53')
sha512sums=('98cbdba54a9f6330470b3a0c2ff0e7771d174bfde90bede7cd3b734c9e29eaf574150185ab0e852699b55ee4f41c704c4b3a746f415528e0cf4c0258ad323369')

build() {
	cd pyctr-${pkgver}
	python setup.py build
}

package() {
	cd pyctr-${pkgver}
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
