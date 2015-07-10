# Maintainer: Carl George < arch at cgtx.us >

_name="docker-py"
_module="${_name%-py}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.3.0"
pkgrel="1"
pkgdesc="An API client for docker written in Python"
arch=("any")
url="https://github.com/docker/${_name}"
license=("Apache")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ac4c960e84a44f5dbbcee775c46c3a8a194241e37767f60d64aa84d704c95dfd')

package_python-docker() {
    depends=("python-requests>=2.5.3"
             "python-six>=1.3.0"
             "python-websocket-client>=0.32.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-docker() {
    depends=("python2-requests>=2.5.3"
             "python2-six>=1.3.0"
             "python2-websocket-client>=0.32.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
