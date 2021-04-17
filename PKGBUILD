# Maintainer: Angrysoft Sebastian Zwierzchowski <sebastian.zwierzchowski@gmail.com>

pkgname=python-pyiot-git
_realname=pyiot
pkgver=v0.1.r109.g02280ab
pkgrel=1
pkgdesc="Python library for IOT devices"
url="https://github.com/angrysoft/pycouchdb"
license=('Apache 2.0')
arch=('any')
depends=('python-setuptools' 'python-pycryptodomex')
source=("${_realname}::git+https://bitbucket.org/angrysoft/pyiot/src/master/")
md5sums=("SKIP")
noextract=()

pkgver() {
  cd ${_realname}
  git describe --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
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

