# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=python-sphinx-favicon
pkgver=0.2
pkgrel=1
pkgdesc="A Sphinx extension to add custom favicons."
arch=('any')
url="https://github.com/tcmetzger/sphinx-favicon"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5f159df2d84be70c94011c0c22a8ea2ba18b630afa0e3e273bd5dd832685a9ca')

build() {
    cd "${pkgname#python-}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname#python-}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=4 sw=4 et:
