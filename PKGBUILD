# Contributor: Butui Hu <hot123tea123@gmail.com>

_pkgname=aioice
pkgname=python-aioice
pkgver=0.10.2
pkgrel=1
pkgdesc='asyncio-based Interactive Connectivity Establishment (RFC 5245)'
arch=('any')
url='https://github.com/aiortc/aioice'
license=('BSD-3-Clause')
depends=(
  python-dnspython
  python-ifaddr
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)

source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/aiortc/aioice/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('425859227f13f9eacc9943a576e7a06959292aef39caf4f2a8a19d988f79608e359a6243b7f4dcafc779adcfab46db31268a83d38e8f108e44b10684fbcd94f2')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
