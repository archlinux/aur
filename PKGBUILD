# Maintainer: éclairevoyant
# Contributor: Gabriele Musco <emaildigabry at gmail dot com>

pkgname=python-openrgb
pkgver=0.2.15
pkgrel=1
pkgdesc="Python client for the OpenRGB SDK"
arch=(any)
_gitname=openrgb-python
url="https://github.com/jath03/$_gitname"
license=(GPL3)
depends=(openrgb python)
makedepends=(git python-setuptools)
source=("git+$url.git#tag=eb47399716a643cbd9ac5e307457c08256a9bc64")
b2sums=('SKIP')

build() {
	cd $_gitname
	python setup.py build
}

package() {
	cd $_gitname
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
