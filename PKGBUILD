# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Michael Stegeman <team@webthings.io>

## GPG keys: https://github.com/mrstegeman.gpg

pkgname=python-gateway-addon
pkgver=1.0.0
pkgrel=2
_commit=71813a8
pkgdesc='WebThings Gateway add-on bindings for Python'
arch=('any')
url='https://github.com/WebThingsIO/gateway-addon-python'
license=('MPL2')
depends=('python-jsonschema' 'python-singleton-decorator' 'python-websocket-client')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('C1B2DF99809504447B2C7209FEDD596D296F7400') ## Michael Stegeman

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}

# vim:set ts=2 sw=2 et ft=sh:
