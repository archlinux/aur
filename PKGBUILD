# Maintainer: Chance Chen <ufbycd@163.com>
pkgname=python-fdt
_name=${pkgname#python-}
pkgver=0.3.3
pkgrel=3
pkgdesc="Flattened Device Tree Python Module"
arch=('any')
url="https://github.com/molejar/pyFDT"
license=('Apache')
groups=()
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/molejar/pyFDT/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('459518f497ac5b3f856f7e0a9bbb5970f0e2ff1910d9955b8f1bae9449883b5f')

build() {
    cd pyFDT-master
    python -m build --wheel --no-isolation
}

package() {
    cd pyFDT-master
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
