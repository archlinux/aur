pkgname=python-pyctr
pkgver=0.4.3
pkgrel=2
pkgdesc="Python library to interact with Nintendo 3DS files"
arch=($CARCH)
license=('MIT')
url='https://github.com/ihaveamac/pyctr'
depends=('python' 'python-pycryptodomex')
makedepends=('python-setuptools')
options=(!strip)
source=("pyctr-${pkgver}.tar.gz::https://github.com/ihaveamac/pyctr/archive/v${pkgver}.tar.gz")
sha256sums=('a669742ccf6b87a51855e9118f4a9b4bda7d43c6ea112532007fc333616bfe5b')
sha512sums=('d4cfaaa2db3923a041b7d62ce296d7f5132e556e221af07ad3bff2215a795ff0a898548e1174e03db818e2299956188f6bade6ca7e7c3ed5dfc4ef4c84b11ba6')

build() {
	cd pyctr-${pkgver}
	python setup.py build
}

package() {
	cd pyctr-${pkgver}
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
