# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-digikey-api
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc="Python client for Digikey API"
url="https://github.com/peeter123/digikey-api"
depends=(
    'python'
    'python-requests'
    'python-retrying'
    'python-fake-useragent'
    'python-schematics'
    'python-inflection'
    'python-certauth'
    'python-urllib3'
)
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('18bf4b7f5c69f83d1f717d3b70df68579353c40225c99ed5b9554af6f148e41b')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
