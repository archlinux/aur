# Maintainer: Eritque Arcus <eritque-arcus at eritque-arcus dot tech>

_name="pyhidra"
pkgname="python-$_name"
pkgver=0.5.2
pkgrel=1
pkgdesc='Pyhidra is a Python library that provides direct access to the Ghidra API within a native CPython interpreter using jpype.'
arch=(any)
url="https://github.com/dod-cyber-crime-center/$_name"
license=(DC3-Pyhidra-Open-Source-License)
depends=(python python-jpype1)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('c8c5c563e5f60391e7194ca7ce1e4bfdf76d84bec8fe783b9db6d5ef1eb38550')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package(){
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
