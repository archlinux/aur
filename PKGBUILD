# Maintainer: Ben <bensongsyz@gmail.com>
pkgname='python-inkscape-figures'
_name=${pkgname#python-}
pkgver='1.0.8'
pkgrel=1
pkgdesc='Script for managing inkscape figures'
arch=('any')
url='https://pypi.org/project/inkscape-figures'
license=('MIT')
depends=('python>=3.7' 'rofi')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('49ced7335a64f2dba4ff3f57f24a7ebd792674395631a248e0edcbe8e6196f32')

build() {
	cd "$srcdir/${_name}-$pkgver"

	python setup.py build
}

package() {
	cd "$srcdir/${_name}-$pkgver"

    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
