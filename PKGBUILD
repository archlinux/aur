# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-blp'
_pkgname='blp'
pkgver=0.0.2
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
sha256sums=('094c09b05fb006769f48309588f4200d593299b58566d03e6a188c16296cd98f')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

