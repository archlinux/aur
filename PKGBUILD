# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-asgiref
_pypi_pkgname=asgiref
pkgver=1.1.1
pkgrel=1
pkgdesc="Reference ASGI adapters and channel layers"
arch=(any)
url=" http://github.com/django/asgiref/"
license=('BSD')
makedepends=('python-setuptools')
depends=('python')
source=("https://pypi.python.org/packages/0d/e7/9fc51765849c89d1ddc7528ec06659dba460a7bf7de1e7b37d685b532fcd/asgiref-1.1.1.tar.gz")
md5sums=('91560c23d3ee340d49ccfeff5ece27ac')

build() {
    cd "${srcdir}/asgiref-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/asgiref-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
