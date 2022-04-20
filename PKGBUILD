# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=plum
pkgname=python-${_pyname,,}
pkgver=0.7.9
pkgrel=1
pkgdesc='Pack/Unpack Memory'
arch=(any)
url="https://$_pyname-py.readthedocs.io/en/latest/"
license=(MIT)
depends=(python)
makedepends=(python-{build,installer}
             python-setuptools
             python-wheel)
_archive="$_pyname-$pkgver"
source=("https://gitlab.com/dangass/$_pyname/-/archive/$pkgver/$_archive.tar.bz2")
sha256sums=('0f660a767ceb7a0374066ab3077fc274c409e751a00a904ddfe6ec88b52549a9')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
