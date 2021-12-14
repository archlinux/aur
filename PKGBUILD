# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=plum
pkgname=python-${_pipname,,}
pkgver=0.7.0
pkgrel=2
pkgdesc='Pack/Unpack Memory'
arch=(any)
url="https://$_pipname-py.readthedocs.io/en/latest/"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
_archive="$_pipname-$pkgver"
source=("https://gitlab.com/dangass/$_pipname/-/archive/$pkgver/$_archive.tar.bz2")
sha256sums=('ad3302aaddd76dba09a96c4006db1c899937c6c5b3ffbf495b69b1bb3bcc7701')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
