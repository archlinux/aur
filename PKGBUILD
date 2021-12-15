# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=plum
pkgname=python-${_pipname,,}
pkgver=0.7.2
pkgrel=1
pkgdesc='Pack/Unpack Memory'
arch=(any)
url="https://$_pipname-py.readthedocs.io/en/latest/"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
_archive="$_pipname-$pkgver"
source=("https://gitlab.com/dangass/$_pipname/-/archive/$pkgver/$_archive.tar.bz2")
sha256sums=('6b2863af4db754892d690563b8304b43c246e8d3a1124ad8aeab83f2fc86ffbc')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
