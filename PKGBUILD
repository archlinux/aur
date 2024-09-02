# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Michael Stegeman <team@webthings.io>

pkgname=python-gateway-addon
pkgver=1.1.1
pkgrel=1
_commit=a54b65c
pkgdesc='WebThings Gateway add-on bindings for Python'
arch=('any')
url='https://github.com/WebThingsIO/gateway-addon-python'
license=('MPL2')
depends=('python-jsonschema' 'python-singleton-decorator' 'python-websocket-client')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname::git+$url#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}

# vim:set ts=2 sw=2 et ft=sh:
