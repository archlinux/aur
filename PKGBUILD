# $Id$
# Maintainer: Shane Stone <shanewstone gmail>
pkgname=python-miniflux
pkgver=1.1.3
pkgrel=1
pkgdesc="Python client for Miniflux API."
arch=('any')
url="https://github.com/miniflux/python-client"
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/miniflux/python-client/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('96421ace662ba8dbbc9b682178af4d7930fa1e6d6a1ce0e4f5857796db22b53db747bce2f19b3930027d36c5c8f5dcc28a05661bf5418fe2cbd9f33ff1955be0')

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
