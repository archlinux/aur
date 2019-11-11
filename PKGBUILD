# Maintainer: Razer <razer@neuf.fr>

pkgname=python-sockjs-tornado
_pypi_pkgname=sockjs-tornado
pkgver=1.0.6
pkgrel=0
pkgdesc="SockJS python server implementation on top of Tornado framework"
url="http://github.com/mrjoes/sockjs-tornado/"
depends=('python' 'python-tornado')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.io/packages/source/s/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('ec12b0c37723b0aac56610fb9b6aa68390720d0c9c2a10461df030c3a1d9af95')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
