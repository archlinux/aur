# Maintainer: Thilo Berger <thilob@gmx.net>

pkgname=sirilic
pkgver='1.15.12'
pkgrel=1
pkgdesc="Siril's Interactive Companion"
arch=('x86_64')
license=('GPL3')
makedepends=(python-build python-installer python-wheel)
url="https://siril.org/docs/sirilic/"
depends=('python' 'python-wxpython')
source=("https://gitlab.com/free-astro/sirilic/-/archive/V${pkgver}/sirilic-V${pkgver}.tar.bz2")
sha256sums=('481940aa52d8bbdc85190103214378cae8ecd5a3eb6be48d1a634d32afed5697')

build() {
    cd "$pkgname-V$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-V$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}


