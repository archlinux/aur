# Contributor: Devaev Maxim <mdevaev@gmail.com>
# Author: Devaev Maxim <mdevaev@gmail.com>


pkgname=python-valkit
pkgver=0.1.4
pkgrel=1
pkgdesc="Yet another Python validators"
license=(GPL)
arch=(any)
url="https://github.com/mdevaev/valkit"
depends=(python)
makedepends=(python-setuptools)
source=("$url/archive/v$pkgver.tar.gz")
md5sums=(SKIP)


build() {
	cd "$srcdir"
	rm -rf valkit-build
	cp -r valkit-$pkgver valkit-build
	cd valkit-build
	python setup.py build
}

package() {
	cd $srcdir/valkit-$pkgver
	python setup.py install --root=$pkgdir
}
