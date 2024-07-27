# $Id$
# Maintainer: Shane Stone <shanewstone gmail>
pkgname=python-miniflux
pkgver=1.0.1
pkgrel=1
pkgdesc="Python client for Miniflux API."
arch=('any')
url="https://github.com/miniflux/python-client"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}::git+${url}#tag=${pkgver}")
sha512sums=('SKIP')

build() {

    cd ${pkgname}-${pkgver}

    python -m build --wheel --no-isolation

}

package() {

    cd ${pkgname}-${pkgver}

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"

}
