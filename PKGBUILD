pkgname=pdfx
pkgver=1.4.1
pkgrel=1
pkgdesc="Extract text, metadata and references from PDF."
arch=('x86_64' 'i686')
url="https://github.com/metachris/pdfx"
license=('APACHE')
depends=('python' 'python-pdfminer')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/metachris/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('9bf3e51729e730ac611f1b38d91deacec1edefa57b8bcae48e57a155a59aa4d3')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}
package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}

