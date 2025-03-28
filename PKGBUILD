# Maintainer: mattski <redmattski at gmail dot com>
# Maintainer: Winux <winux@winux.cc>

pkgname=python-audible-series
_name=${pkgname#python-}
pkgver=1.1.0
pkgrel=1
pkgdesc="Supports looking up new series releases on audible via audible-cli"
arch=(any)
url=https://github.com/luscoma/audible-series
license=(APACHE)
depends=(python python-audible-cli python-yaml)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('82700637191144dbbc0b3f360709baeffee8ff24549b75035b051a6f985e735d')

build() {
    cd ${_name//-/_}-$pkgver
    python -m build --wheel --no-isolation
}
package() {
    cd ${_name//-/_}-$pkgver
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

