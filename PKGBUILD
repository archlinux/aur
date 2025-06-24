# $Id$
# Maintainer: Shane Stone <shanewstone gmail>
pkgname=python-miniflux
pkgver=1.1.4
pkgrel=1
pkgdesc="Python client for Miniflux API."
arch=('any')
url="https://github.com/miniflux/python-client"
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/miniflux/python-client/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('c9ae73d9efe74331587e18673c527d8364abe3b28c77b8cd5dcace952c65149610b45423d89aac1d8f7c92a61f39a1a59eb314f1f19ebf3f8ea07e1577877cd7')

build() {

    cd "python-client-${pkgver}"

    python -m build --wheel --no-isolation

}

package() {

    cd "python-client-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

}
