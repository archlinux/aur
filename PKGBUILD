# Contributor: Dan Denkijin <dandenkijin at gmail dot com>
# Maintainer: Dan Denkijin <dandenkijin at gmail dot com>

pkgname=riverwm-utils
pkgver=0.0.10.r3.gbed817b
pkgrel=1
pkgdesc="Utilities for the River Wayland compositor"
arch=(any)
url="https://github.com/NickHastings/${pkgname}"
license=(GPLv3)
makedepends=('git'
             'python-installer'
             'python-build'
             'python-wheel'
             'python-pywayland')
source=("git+${url}.git")
md5sums=('SKIP')
pkgver() {
  	cd $srcdir/$pkgname
  	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
	cd $srcdir/$pkgname
  	python -m build --wheel --no-isolation
}
package() {
 	cd $srcdir/$pkgname
    	python -m installer --destdir="$pkgdir" dist/*.whl
}

