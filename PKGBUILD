# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-pytest-reraise'
_pkgname='pytest-reraise'
pkgver='2.1.2'
pkgrel=1
pkgdesc="Make multi-threaded pytest test cases fail when they should"
url="https://github.com/bjoluc/pytest-reraise"
checkdepends=()
depends=(python python-pytest)
makedepends=(python-build python-installer python-poetry-core python-wheel)
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
    "https://github.com/bjoluc/pytest-reraise/blob/main/license")
sha256sums=('5ab59bd0e2028be095289e6dfc9e36cc0b56936465278f3223e81bea0f2d1c70'
            'e8456e96cda53dc5e59c221c985f147c3cea1e1033796ebbb19027fbf44dc541')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build -wnx
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 ../license "$pkgdir/usr/share/licenses/$pkgname/license"
}
