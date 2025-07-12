# Maintainer: Klimenko Maxim Sergievich <klimenkomaximsergievich@gmail.com>

_name="pyboinc-git"
_pkgbase="${_name}"
pkgbase="${_name}"
pkgname=("${pkgbase}")
pkgver=0.0.3
pkgrel=1
pkgdesc="PyBOINC - a very basic python BOINC bridge"
url="https://github.com/nielstron/pyboinc"
license=('MIT')
arch=(any)
conflicts=('pyboinc')
source=("${pkgname}::git+https://github.com/nielstron/pyboinc.git")
sha1sums=('SKIP')

makedepends=(git python-build python-installer python-wheel)

build() {
    cd "$_name"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
