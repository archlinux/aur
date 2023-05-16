# Maintainer: Razer <razer@neuf.fr>

pkgname=python-sockjs-tornado
_pypi_pkgname=sockjs-tornado
pkgver=1.0.7
pkgrel=4
pkgdesc="SockJS python server implementation on top of Tornado framework"
url="http://github.com/mrjoes/sockjs-tornado/"
depends=('python' 'python-tornado')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.io/packages/source/s/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('02ff25466b3a46b1a7dbe477340b042770ac078de7ea475a6285a28a75eb1fab')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
