pkgname=sqlite-utils
pkgver=3.25
pkgrel=1
pkgdesc="CLI tool and Python utility functions for manipulating SQLite databases"
arch=("any")
url="https://sqlite-utils.datasette.io/"
license=("Apache")
depends=("python-sqlite-fts4" "python-click" "python-click-default-group" "python-tabulate")
makedepends=("python-setuptools")
conflicts=("sqlite-utils")
source=("https://pypi.io/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("38a970b97c17194d9605ab84df749802e1f3bcf06135dc180779d0a39576b142")

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
