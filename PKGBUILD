# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=babelfont
pkgname=python-$_pipname
pkgver=0.0.2
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('eff455d733eab1f1ad9cf45f28301a98fa19878b40254f0d497d8cca9c243a59')

build() {
    cd "$_pipname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
