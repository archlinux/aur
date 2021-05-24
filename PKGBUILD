# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-daemons
_name=${pkgname#python-}
pkgver=1.3.1
pkgrel=1
pkgdesc="Python unix daemon base classes."
arch=('any')
url="https://github.com/kevinconway/daemons"
license=('Apache')
depends=('python-eventlet' 'python-gevent')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('49e7a9cad5c7c06f88af95fa0dba299e1c0d3d911f1512b203dd20f5e74b6cea')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
