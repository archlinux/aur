# Maintainer: Eric Fung <loseurmarbles at gmail dot com>
pkgname=python-collections-extended
_pkgname=${pkgname#python-}
pkgver=2.0.2
pkgrel=1
pkgdesc='Extra Python Collections - bags(multiset), setlists, RangedMap and IndexedDict'
arch=('any')
url='https://github.com/mlenzen/collections-extended'
license=('APACHE')
makedepends=('python-poetry-core' 'python-build' 'python-installer')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cea43f0ef321b23866a76b729d74f094a6d1b58286a5167b7f517360f8336f1a')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
