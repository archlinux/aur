# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=python-sphinx-favicon
pkgver=1.0.1
pkgrel=1
pkgdesc="A Sphinx extension to add custom favicons."
arch=('any')
url="https://github.com/tcmetzger/sphinx-favicon"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6f17726fd8c8fc9e092a2e21244b3ecd4a291a5d5b88cc4d4541732b3cf86c27')

build() {
    cd "${pkgname#python-}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname#python-}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=4 sw=4 et:
