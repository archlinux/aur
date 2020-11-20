# Maintainer: Matthew Murray <matt@compti.me>
pkgname=python-plum-py
_name=${pkgname#python-}
pkgver=0.3.1
pkgrel=1
pkgdesc="Classes and utility functions to efficiently pack and unpack bytes"
arch=('any')
license=('MIT')
depends=("python")
makedepends=("python-pip")
url="https://pypi.org/project/plum-py"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name/-/_}-$pkgver-py3-none-any.whl")
md5sums=('afa75d700e2285f0c0dafac56c3658d9')

package() {
    cd "$srcdir"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}

# vim:set ts=2 sw=2 et:
