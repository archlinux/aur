# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-traces
pkgver=0.6.0
pkgrel=1
pkgdesc="Python library for unevenly-spaced time series analysis"
url="https://pypi.org/project/traces/"
depends=(python-infinity)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
_commit=0788ff2cc863c026226f240352fcdfb04634afe5
source=("https://github.com/datascopeanalytics/traces/archive/${_commit}.tar.gz")
sha256sums=(SKIP)

build() {
    cd "traces-${_commit}"
    python setup.py build
}

package() {
    cd "traces-${_commit}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -D LICENSE "${pkgdir}/usr/share/licenses/python-traces/LICENSE"
}
