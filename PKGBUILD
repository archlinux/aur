# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=babelfont
pkgname=python-$_pipname
pkgver=2.0.2
pkgrel=1
pkgdesc='Interrogate and manipulate UFO, TTF and OTF fonts with a common interface'
arch=('any')
url="https://github.com/simoncozens/$_pipname"
license=('MIT')
_py_deps=('defcon'
          'fontparts'
          'fonttools')
depends=('python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/$_pipname/$_pipname-$pkgver.tar.gz")
sha256sums=('4fe45910e0260f17045c6860a0e04c387af95fb795ad180131c7b33f6a3db40a')

build() {
    cd "$_pipname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
