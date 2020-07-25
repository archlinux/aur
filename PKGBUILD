# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=uharfbuzz
pkgname=python-$_pyname
pkgver=0.12.0
pkgrel=1
pkgdesc='Streamlined Cython bindings for the harfbuzz shaping engine'
arch=('x86_64')
url="https://github.com/harfbuzz/$_project"
license=('Apache')
depends=('python')
makedepends=('cython' 'python-setuptools' 'python-scikit-build')
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.zip")
sha256sums=('c3046143439e4413c1227b1da3e25c4172d2adf70b68c2bddf7a3b9c8e179611')

build() {
    cd "$_pyname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pyname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
