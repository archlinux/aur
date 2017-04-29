# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

pkgname=python-lmdb
pkgver=0.92
pkgrel=1
pkgdesc="Universal Python3 binding for the LMDB Lightning Database"
arch=('any')
url="https://github.com/dw/py-lmdb/"
license=('custom')
depends=('python' 'lmdb')
makedepends=('python-setuptools')
source=("https://github.com/dw/py-lmdb/archive/py-lmdb_${pkgver}.tar.gz")
sha256sums=('8bed442e5b3dae112613c5f305547575941a7dac2aaa70b2ce68506dd4371a0e')

build() {
    cd "py-lmdb-py-lmdb_$pkgver"
    LMDB_FORCE_SYSTEM=1 python setup.py build
}

package() {
    cd "py-lmdb-py-lmdb_$pkgver"
    LMDB_FORCE_SYSTEM=1 python setup.py install --root="$pkgdir" --optimize=1
    
    # license
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
