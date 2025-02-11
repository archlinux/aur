# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-digikey-api
_name=${pkgname#python-}
pkgver=1.1.0
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
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('2615205f89320219a8d92bedf449f2572b33271aad57519d279bc37128d623a4')

build() {
	cd "$srcdir/${_name//-/_}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_name//-/_}-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
