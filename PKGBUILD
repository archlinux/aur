# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=ttfautohint-py
pkgname=python-$_pyname
pkgver=0.4.3
pkgrel=1
pkgdesc="Python wrapper for ttfautohint, a free auto-hinter for TrueType fonts"
url="https://github.com/fonttools/$_pyname"
arch=('x86_64')
license=('MIT')
depends=('python')
makedepends=('python-pip')
_py=py2.py3
_wheel=${_pyname/-/_}-$pkgver-$_py-none-manylinux1_x86_64.whl
source=("https://files.pythonhosted.org/packages/$_py/${_pyname::1}/$_pyname/$_wheel")
sha256sums=('f000fe9d99ab75e2fc6ca4bb7161ddf392974a86dca878a92484498489759d03')

package() {
    export PIP_CONFIG_FILE=/dev/null
    pip install --isolated --root="$pkgdir" --ignore-installed --no-deps $_wheel
}
