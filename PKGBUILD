# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-pyffmpeg
_py_name=${pkgname#python-}
pkgver=2.0.5.1
pkgrel=2
pkgdesc='FFmpeg wrapper for Python'
arch=(any)
url="https://github.com/deuteronomy-works/$_py_name"
license=(Apache)
depends=(ffmpeg
         python)
makedepends=(python-setuptools)
_archive="$_py_name-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_py_name::1}/$_py_name/$_archive.tar.gz")
sha256sums=('e7bbd0ecb97bc2298a535e2c4993a458046b9c9d0e5e1ccbcd245e0b2fa02222')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
