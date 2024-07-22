# Maintainer: gilcu3

_pkgname=py_ecc
pkgname=python-$_pkgname
pkgdesc="Elliptic curve crypto in python including secp256k1, alt_bn128, and bls12_381."
pkgver=7.0.1
pkgrel=1
arch=(any)
url="https://github.com/ethereum/py_ecc"
license=('MIT')
depends=(python)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=($url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('c600e33b22d194636c2be360cf2d381effa4ccfe95fb300b7a4906901d38dc41')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
