# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-mpris_server
_name=${pkgname#python-}
pkgver=0.3.3
pkgrel=1
pkgdesc="Integrate MPRIS Media Player support into your app"
arch=('any')
url="https://github.com/alexdelorenzo/mpris_server"
license=('AGPL3')
depends=('python-gobject' 'python-pydbus' 'python-unidecode' 'python-emoji')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b148880e29956f44b2ec809f2f771db4d03a6a948dd164328c9d58cf1d9dff53')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
