# Maintainer: Luke Arms <luke@arms.to>
# Contributor: Francois Garillot <francois[at]garillot.net>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo[@]gmail.com>
pkgname=python-demjson3
_pkgname=${pkgname#python-}
pkgver=3.0.6
pkgrel=1
pkgdesc="encoder, decoder, and lint/validator for JSON (JavaScript Object Notation) compliant with RFC 7159"
arch=('any')
url="https://github.com/nielstron/demjson3"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
provides=('demjson' 'python-demjson')
conflicts=('demjson' 'python-demjson' 'nodejs-jsonlint')
sha256sums=('37c83b0c6eb08d25defc88df0a2a4875d58a7809a9650bd6eee7afd8053cdbac')
# https://warehouse.pypa.io/api-reference/integration-guide.html#querying-pypi-for-package-urls
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
