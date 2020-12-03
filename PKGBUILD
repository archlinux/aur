# Maintainer: pumpkincheshire <sollyonzou at gmail dot com>

_name=sansio_multipart
pkgname=python-sansio-multipart
pkgver=0.3
pkgrel=2
pkgdesc="A sansio multipart parser for Python 3"
arch=('any')
url="https://github.com/theelous3/sansio-multipart-parser"
license=('MIT')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('6e95b2e64039a95d0f2cd8f3360eaf418d6b9018fb2215d82d399d62d6122dc3')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
