# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-pyamdgpuinfo
_name=${pkgname#python-}
pkgver=2.1.0
pkgrel=1
pkgdesc="AMD GPU stats"
arch=('x86_64')
url="https://github.com/mark9064/pyamdgpuinfo"
license=('GPL3')
depends=('python' 'libdrm')
makedepends=('python-setuptools' 'cython')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('09782a1cc8d05f955016f26a492e2bb884f1424d263889c5fdae6671c83b32ce')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
