# $Id$
# Maintainer: Shane Stone <shanewstone gmail>
pkgname=python-miniflux
pkgver=1.0.1
pkgrel=1
pkgdesc="Python client for Miniflux API."
arch=('any')
url="https://github.com/miniflux/python-client"
license=('MIT')
depends=('python-requests')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/miniflux/python-client/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('d38f6c1ef389e4d49ab0aca8d7ed8587b997cb5e48ff0c18b22b826aa92ed4e62417f7341a4cc77c2fea38861577d28e1644a838fc3afd5d3287273473de3aa3')

build() {

    cd "python-client-${pkgver}"

    python -m build --wheel --no-isolation

}

package() {

    cd "python-client-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"

}
