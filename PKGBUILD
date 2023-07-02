# Maintainer: Thilo Berger <thilob@gmx.net>

pkgname=sirilic
pkgver='1.15.2'
pkgrel=1
pkgdesc="Siril's Interactive Companion"
arch=('x86_64')
license=('GPL3')
makedepends=(python-build python-installer python-wheel)
url="https://siril.org/docs/sirilic/"
depends=('python' 'python-wxpython')
source=("https://gitlab.com/free-astro/sirilic/-/archive/V1.15.2/sirilic-V${pkgver}.tar.bz2")
sha256sums=('df2a3f5b8d53f79e30cbd4130263b543e1ef034782b25e393a7a6df8ddd4fb9f')

build() {
    cd "$pkgname-V$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-V$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}


