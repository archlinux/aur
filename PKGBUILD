# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Co-Maintainter: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-portolan
_name=${pkgname#python-}
pkgver=1.0.1
pkgrel=1
pkgdesc="Convert between compass points and degrees"
arch=('any')
url="https://github.com/fitnr/portolan"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("$_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ce9d81b60ab705f1e305d3d691883d740bf35079acea75ea448927915b220d4c')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
