# Maintainer: Michael Stegeman <mstegeman@mozilla.com>
pkgname='python-gateway-addon'
pkgver=0.10.0
pkgrel=2
pkgdesc='Mozilla WebThings Gateway add-on bindings for Python'
arch=('any')
url='https://github.com/mozilla-iot/gateway-addon-python'
license=('MPL2')
depends=(
  'python-jsonschema'
  'python-nnpy'
  'python-singleton-decorator'
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
