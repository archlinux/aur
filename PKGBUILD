# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=uharfbuzz
pkgname=python-$_pyname
pkgver=0.16.0
pkgrel=1
pkgdesc='Streamlined Cython bindings for the harfbuzz shaping engine'
arch=('x86_64')
url="https://github.com/harfbuzz/$_project"
license=('Apache')
depends=('python')
makedepends=('cython' 'python-setuptools' 'python-scikit-build')
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.zip")
sha256sums=('70f11ccfbb59028dec6ce768960ffcc4d44eee0e095d7b58421799d5e84cb17a')

build() {
    cd "$_pyname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pyname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
