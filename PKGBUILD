# Maintainer: Michael Spencer <sonrisesoftware@gmail.com>
pkgname=this
pkgver=0.3
pkgrel=2
pkgdesc="Standardized project tool for running common tasks"
url="https://github.com/ibelieve/this"
license=('MIT')
arch=('any')
depends=('python' 'python-click')
makedepends=('python-setuptools' 'python-pytest' 'python-pytest-mock')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ibelieve/this/archive/v${pkgver}.tar.gz")
md5sums=('80a8b43eefcc4c5c215f6f04b4fbb635')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	python setup.py test
	python setup.py check
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
