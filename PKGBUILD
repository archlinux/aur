# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# Contributer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='oyaml'
pkgname="python-oyaml"
pkgver="1.0"
pkgrel=3
pkgdesc="Ordered YAML: drop-in replacement for PyYAML which preserves dict ordering"
arch=("any")
url="https://github.com/wimglenn/${_pkgname}"
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("9b49953ab13e1db45126b82264941a4b1630d2bf5c3c56c8b9d12bff2708dac1")
license=("MIT")
depends=("python-yaml")
makedepends=('python-setuptools')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
