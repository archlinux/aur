# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-digikey-api
_name=${pkgname#python-}
pkgver=0.4.0
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
sha256sums=('b21c75f26cd34e6da99191b643edebb2a188bd9f91654065d42a5f70901d19de')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
