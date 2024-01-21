# Maintainer: Eritque Arcus <eritque-arcus at eritque-arcus dot tech>

_name="pyhidra"
pkgname="python-$_name"
pkgver=0.5.3
pkgrel=1
pkgdesc='Pyhidra is a Python library that provides direct access to the Ghidra API within a native CPython interpreter using jpype.'
arch=(any)
url="https://github.com/dod-cyber-crime-center/$_name"
license=(DC3-Pyhidra-Open-Source-License)
depends=(python python-jpype1)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('b3ac58a3219d2bbe7a49f88f02ab6bf83eea5376a19b6f894f9178ef9be2945a')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package(){
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
