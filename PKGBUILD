# Maintainer: Luke Arms <luke@arms.to>
# Contributor: Francois Garillot <francois[at]garillot.net>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo[@]gmail.com>
pkgname=python-demjson3
_pkgname=${pkgname#python-}
pkgver=3.0.5
pkgrel=1
pkgdesc="Fork of demjson to purely support Python 3. Python module for JSON data encoding, including jsonlint."
arch=('any')
url="https://github.com/nielstron/demjson3"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
provides=('demjson' 'python-demjson')
conflicts=('demjson' 'python-demjson' 'nodejs-jsonlint')
sha256sums=('ab9aabdd85695f3684fc296f39766a2730f6c8de81d23f7048073dfe2f616d80')
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
