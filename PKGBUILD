# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-bls
_name=
pkgver=0.1.10
pkgrel=1
pkgdesc="BLS12-381 and Signatures in Python"
url="https://github.com/zebra-lucky/python-bls"
arch=('i686' 'x86_64')
license=('Apache2')
depends=('python')
makedepends=('python-setuptools' 'cython')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zebra-lucky/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('5aaf5c668425116263bf6c3142d21b79d8c134a91c83a6169c8f2a08530b6839')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
