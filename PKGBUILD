# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=uharfbuzz
pkgname=python-$_pyname
pkgver=0.13.2
pkgrel=1
pkgdesc='Streamlined Cython bindings for the harfbuzz shaping engine'
arch=('x86_64')
url="https://github.com/harfbuzz/$_project"
license=('Apache')
depends=('python')
makedepends=('cython' 'python-setuptools' 'python-scikit-build')
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.zip")
sha256sums=('b3be12f2118cb5f301ed51b360a6188eab23f24704b9d2ffa830315d31923efb')

build() {
    cd "$_pyname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pyname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
