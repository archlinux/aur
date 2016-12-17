# vim: set ft=sh ts=4 sw=4 sts=4 et:
# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>

pkgname=python-license
pkgver=0.1.0
pkgrel=2
pkgdesc='A command line app that fetches opensource licenses.'
arch=(any)
url='https://github.com/codemonkey800/python-license'
license=(MIT)
depends=(
    python
    python-click
    python-click-completion
    python-click-didyoumean
    python-psutil
    python-requests
    python-requests-cache
)
makedepends=(python-setuptools)
source=("https://github.com/codemonkey800/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=(d5eded862d8f6254dc9445e1fece1436)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install -O1 --skip-build --prefix=/usr --root="${pkgdir}"
}

