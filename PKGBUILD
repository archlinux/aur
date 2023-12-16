# Maintainer: Robin Ekman < robin.seth.ekman [at] gmail [dot] com >

pkgname=python-ass
pkgver=0.5.4
pkgrel=2
pkgdesc="A library for parsing and manipulating Advanced SubStation Alpha subtitle files."
url='http://github.com/chireiden/python-ass'
arch=('any')
license=('MIT')
depends=(
    'python>=3.8'
    'libass'
)
makedepends=('python-setuptools')
checkdepends=(
    'python-pytest'
    'python-pillow'
)
source=('https://github.com/chireiden/python-ass/archive/refs/tags/0.5.4.tar.gz')
sha256sums=('1a2bf40a87f1a4b7d81fac5805289bfcd11d202e00e5844211d0dda44c884618')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check () {
    pytest "${pkgname}-${pkgver}"
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
