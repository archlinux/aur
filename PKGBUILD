pkgname=sqlite-utils
pkgver=3.36
pkgrel=1
pkgdesc="CLI tool and Python utility functions for manipulating SQLite databases"
arch=("any")
url="https://sqlite-utils.datasette.io/"
license=("Apache")
depends=("python-sqlite-fts4" "python-click" "python-click-default-group" "python-tabulate" "python-dateutil" "python-pluggy")
makedepends=("python-setuptools")
conflicts=("sqlite-utils")
source=("https://pypi.io/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("dcc311394fe86dc16f65037b0075e238efcfd2e12e65d53ed196954502996f3c")

build() {
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root=${pkgdir} --optimize=1
	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
