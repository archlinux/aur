# Contributor: Butui Hu <hot123tea123@gmail.com>

_pkgname=aioice
pkgname=python-aioice
pkgver=0.10.1
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
sha512sums=('1beaf09517c9918bce0e5f32c1ff7fd08a1a7ff90af49e1525f5bd4cb875f96522a72e022c5e6da5067671b9f3c09159e8f441374b53a31f659d194f3d75e2da')

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
