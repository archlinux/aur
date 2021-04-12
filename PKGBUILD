# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-mpris_server
_name=${pkgname#python-}
pkgver=0.2.17
pkgrel=1
pkgdesc="Integrate MPRIS Media Player support into your app"
arch=('any')
url="https://github.com/alexdelorenzo/mpris_server"
license=('AGPL3')
depends=('python-gobject>=3.34.0' 'python-pydbus>=0.6.0' 'python-unidecode=1.2.0'
         'python-emoji=1.2.0')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a41e4dce2e322a991640c4b2b02010d6233d2d9306eb271f41721d49bba63248')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
