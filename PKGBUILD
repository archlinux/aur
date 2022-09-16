# Maintainer: Philipp A. <flying-sheep@web.de>
_name=better_exchook
pkgname=python-$_name
pkgver=1.20220510.124015
pkgrel=2
pkgdesc='A nicer drop-in-replacement for Python sys.excepthook'
arch=(any)
url='https://github.com/albertz/py_better_exchook'
license=(BSD)
depends=(python)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('237f2be7f6a8add7666e0207c5643af3d279400a7dc8ff788ecf9d2d5851d0a1')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
