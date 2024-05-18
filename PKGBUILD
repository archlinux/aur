# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-error-helper
_name=${pkgname#python-}
pkgver=1.1
pkgrel=1
pkgdesc="minimalistic python module which helps you print colorful messages for CLI tools"
url="https://github.com/30350n/error_helper"
depends=(
    'python'
)
makedepends=(python-build python-installer python-wheel python-hatchling)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('7753b3e7509373b7f525ced9b98da3bed09e3c3839c93405b061f00e5a7e67ab')

build() {
	cd "$srcdir/${_name//-/_}-$pkgver/${_name//-/_}"
    python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${_name//-/_}-$pkgver/${_name//-/_}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
