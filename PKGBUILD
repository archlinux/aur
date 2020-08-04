# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-pyamdgpuinfo
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
pkgdesc="AMD GPU stats"
arch=('x86_64')
url="https://github.com/mark9064/pyamdgpuinfo"
license=('GPL3')
depends=('python' 'libdrm')
makedepends=('python-setuptools' 'cython')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('32ee95d818270c6617c59f778a40eb304ae030c0f1ee7e09bfb14b483e00a827')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
