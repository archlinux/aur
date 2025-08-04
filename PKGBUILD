# Maintainer:  Oliver Kahrmann <oliver.kahrmann at gmail dot com>

pkgname=python-pysnmplib
_name=pysnmp
pkgver=5.0.24
pkgrel=1
pkgdesc='This is a pure-Python, open source and free implementation of v1/v2c/v3 SNMP engine'
arch=('any')
url='https://github.com/pysnmp/pysnmp'
license=('BSD-2-Clause')
depends=(
  'python'
  'python-pysmi'
  'python-pycryptodomex'
  'python-pyasn1'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-poetry-core'
)
conflicts=(
	'python-pysnmp'
)
source=("https://github.com/pysnmp/pysnmp/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('21960c2ad4f9ba5433a5cb1a218b96b6590aa55bea41cde63e89bacb0e15a148ecd2636097ec85929f167ebc00244775e73e4e61e00c8b3e125b11246cbfdc59')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
