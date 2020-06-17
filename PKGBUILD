# Maintainer: argymeg <argymeg at gmail dot com>

_name=interop
_py=cp38
pkgname=python-$_name
pkgver=1.1.10
pkgrel=1
pkgdesc='C++ Library to parse Illumina InterOp files - Python bindings'
url="https://github.com/Illumina/$_name"
arch=('x86_64')
license=('GPL3')
depends=('python>=3.8' 'python<3.9' 'python-numpy')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-$pkgver-$_py-${_py}-manylinux1_x86_64.whl")
sha256sums=('f647074d5d7bc17f3766bb457fa127b89a4fcefd3707296d1c859e80263f0250')

check() {
        python $_name/CoreTests.py
}

package() {
	cd "$srcdir"
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
