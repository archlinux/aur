# Maintainer: Angrysoft Sebastian Zwierzchowski <sebastian.zwierzchowski@gmail.com>

pkgname=python-pycouchdb-git
_realname=pycouchdb
pkgver=0.3.r32.gacd57d0
pkgrel=2
pkgdesc="Python client library for CouchDb 3.x.x"
url="https://github.com/angrysoft/pycouchdb"
license=('Apache 2.0')
arch=('any')
depends=('python-setuptools')
source=("git+https://github.com/angrysoft/pycouchdb#branch=master")
md5sums=("SKIP")
noextract=()

pkgver() {
  cd ${_realname}
  git describe --tags | sed 's+-+.r+' |tr - .
}

build() {
  cd ${_realname}
  python setup.py build
}

package() {
  cd ${_realname}
  python setup.py install --root="$pkgdir" --optimize=1

  install -D -m644 "LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

