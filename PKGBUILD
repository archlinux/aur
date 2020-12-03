# Maintainer: pumpkincheshire <sollyonzou at gmail dot com>

_name=overly
pkgname=python-overly
pkgver=0.1.85
pkgrel=2
pkgdesc="An overly configurable http server for client testing."
arch=('any')
url="https://github.com/theelous3/overly"
license=('MIT')
depends=('python-sansio-multipart' 'python-h11')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('20a99526c7859acc859e87afd97b5c4916405e7477834f727b49210e478370cb')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/$pkgname"
}
