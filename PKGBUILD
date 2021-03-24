# Maintainer: Angrysoft Sebastian Zwierzchowski <sebastian.zwierzchowski@gmail.com>

pkgname=python-pyiot-git
_realname=pyiot
pkgver=v0.1.r5.g752888c
pkgrel=1
pkgdesc="Python library for IOT devices"
url="https://github.com/angrysoft/pycouchdb"
license=('Apache 2.0')
arch=('any')
depends=('python-setuptools' 'python-pycryptodomex')
source=("git+https://angrysoft@bitbucket.org/angrysoft/pyiot.git")
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

  #install -D -m644 "LICENSE" \
  #  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

