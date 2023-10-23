# Maintainer: Thilo Berger <thilob@gmx.net>

pkgname=sirilic
pkgver='1.15.8'
pkgrel=1
pkgdesc="Siril's Interactive Companion"
arch=('x86_64')
license=('GPL3')
makedepends=(python-build python-installer python-wheel)
url="https://siril.org/docs/sirilic/"
depends=('python' 'python-wxpython')
source=("https://gitlab.com/free-astro/sirilic/-/archive/V${pkgver}/sirilic-V${pkgver}.tar.bz2")
sha256sums=('c736a0a22c8f265f6546dae4577fc75fd8a0e966da298618ab24603a54883d43')

build() {
    cd "$pkgname-V$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-V$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}


