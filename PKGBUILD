# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-blp'
_pkgname='blp'
pkgver=0.0.3
pkgrel=1
pkgdesc='Pythonic interface for Bloomberg Open API'
url='https://github.com/matthewgilbert/blp'
checkdepends=()
depends=('python')
makedepends=(python-build python-installer python-wheel)
optdepends=()
license=('Apache-2.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('b025e9f58c47ef383132b9718e463de6c1274b61773c52f2b4cb9f340b9ee62f')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

