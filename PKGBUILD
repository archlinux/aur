# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-pyffmpeg
_py_name=${pkgname#python-}
pkgver=2.1.0
pkgrel=1
pkgdesc='FFmpeg wrapper for Python'
arch=(any)
url="https://github.com/deuteronomy-works/$_py_name"
license=(Apache)
depends=(ffmpeg
         python)
makedepends=(python-setuptools)
_archive="$_py_name-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_py_name::1}/$_py_name/$_archive.tar.gz")
sha256sums=('a2daabbebc11b3293670316e073abca6a0d70df53149cb3566e72d052176b86e')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
