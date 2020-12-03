# Maintainer: Michael Stegeman <team@webthings.io>
pkgname='python-gateway-addon'
pkgver=1.0.0
pkgrel=1
pkgdesc='WebThings Gateway add-on bindings for Python'
arch=('any')
url='https://github.com/WebThingsIO/gateway-addon-python'
license=('MPL2')
depends=(
  'python-jsonschema'
  'python-singleton-decorator'
  'python-websocket-client'
)
makedepends=('git' 'python-setuptools')
source=(
  "git+${url}.git"
)
sha256sums=(
  'SKIP'
)

build() {
  cd "${srcdir}/gateway-addon-python"
  git checkout "v${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/gateway-addon-python"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et ft=sh:
