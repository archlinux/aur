# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-aiopath
_name=${pkgname#python-}
pkgver=0.5.6
pkgrel=2
pkgdesc="Asynchronous pathlib for Python"
arch=('any')
url="https://github.com/alexdelorenzo/aiopath"
license=('LGPL3')
depends=('python-aiofile' 'python-aiofiles')
makedepends=('python-setuptools')
#source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2ced30066921313a77dacfdce798c4bc7d7c400ca608c1111c84e5cc6ade6e42')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
