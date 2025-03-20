# Maintainer: moetayuko <loli at yuko dot moe>

_module=browser_cookie3
pkgname=python-${_module/_/-}
pkgver=0.20.1
pkgrel=2
pkgdesc="Loads cookies used by your web browser into a cookiejar object"
url="https://github.com/borisbabic/browser_cookie3"
depends=('python-lz4' 'python-pycryptodomex' 'python-jeepney')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("$_module-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1ac710ae32aa9732f685a76a916a7004be5c0df619c129c29b7858d193b70e6b')

build() {
	cd $srcdir/$_module-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $srcdir/$_module-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
