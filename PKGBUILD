# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=uharfbuzz
pkgname=python-$_pyname
pkgver=0.15.0
pkgrel=1
pkgdesc='Streamlined Cython bindings for the harfbuzz shaping engine'
arch=('x86_64')
url="https://github.com/harfbuzz/$_project"
license=('Apache')
depends=('python')
makedepends=('cython' 'python-setuptools' 'python-scikit-build')
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.zip")
sha256sums=('5fa6ea32152a1e6fb5060b447f1b76e5e4e34bff288dca81c965fd45f67015d1')

build() {
    cd "$_pyname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pyname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
