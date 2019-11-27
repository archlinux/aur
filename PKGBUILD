# Maintainer: Michael Stegeman <mstegeman@mozilla.com>
pkgname='python-gateway-addon'
pkgver=0.10.0
pkgrel=1
pkgdesc='Mozilla WebThings Gateway add-on bindings for Python'
arch=('any')
url='https://github.com/mozilla-iot/gateway-addon-python/'
license=('MPL2')
depends=(
  'python-jsonschema'
  'python-nnpy'
  'python-singleton-decorator'
)
makedepends=('git' 'python-setuptools')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/mozilla-iot/gateway-addon-python/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  'b288d3e5adaa9de103e8e340c82889f6afa9dfee1b1e6d01d175c55ccf1cc0f3'
)

build() {
  cd "${srcdir}/gateway-addon-python-${pkgver}"
  git init
  python setup.py build
}

package() {
  cd "${srcdir}/gateway-addon-python-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et ft=sh:
