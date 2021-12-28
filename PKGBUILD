# Maintainer: Luke Arms <luke@arms.to>
# Contributor: Francois Garillot <francois[at]garillot.net>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo[@]gmail.com>
pkgname=python-demjson
pkgver=2.2.4
pkgrel=4
pkgdesc="Encoder, decoder, and lint/validator for JSON (JavaScript Object Notation) compliant with RFC 7159"
arch=('any')
url="https://github.com/dmeranda/demjson"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
conflicts=('nodejs-jsonlint')
sha256sums=('654ac60df2f809acb0970f8ec475b16a973243065ba4cb32a6a363feb71156ee')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dmeranda/demjson/archive/refs/tags/release-$pkgver.tar.gz")

build() {
    cd "demjson-release-$pkgver"
    python setup.py build
}

package() {
    cd "demjson-release-$pkgver"
    python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
