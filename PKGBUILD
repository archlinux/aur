# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-priority
_pypi_pkgname=priority
pkgver=1.3.0
pkgrel=1
pkgdesc="A pure-Python implementation of the HTTP/2 priority tree"
arch=(any)
url="https://python-hyper.org/priority/en/latest/"
license=('BSD')
makedepends=('python-setuptools')
depends=('python')
source=("https://pypi.io/packages/source/p/priority/priority-${pkgver}.tar.gz")
md5sums=('4f1ff52f7fa448e9d9cb46337ae86d1e')

build() {
    cd "${srcdir}/priority-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/priority-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
