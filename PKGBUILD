# Maintainer: éclairevoyant

pkgname=cpuset
pkgver=1.6
pkgrel=2
pkgdesc="Python app to make using the cpusets facilities in the Linux kernel easier"
arch=(any)
url="https://github.com/lpechacek/$pkgname"
license=(GPL2)
depends=(python)
makedepends=(python-setuptools)
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('389c274981fe9a23188da71ce0fbc1e0bcdfe6dbe0108bf45659511cbbf711022108914e16aa679c0934f9a5a06b69129738d5f85e96aeb7604cef9c840133a3')

build() {
	cd $pkgname-$pkgver
	python setup.py build
}

package() {
	cd $pkgname-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
