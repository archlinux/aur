# Maintainer: Butui Hu <hot123tea123@gmail.com>

_pkgname=aiortc
pkgname=python-aiortc
pkgver=1.7.0
pkgrel=1
pkgdesc='WebRTC and ORTC implementation for Python using asyncio'
arch=('x86_64')
url='https://github.com/aiortc/aiortc'
license=('BSD')
depends=(
  python-aioice
  python-av
  python-cffi
  python-cryptography
  python-google-crc32c
  python-pyee
  python-pylibsrtp
  python-pyopenssl
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)

source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/aiortc/aiortc/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('774ab307890ca1e2f945e4c4bd53ab5fd8cec349bd7aab056bf600fda5143571c29ab06f9a694a017a4fb65f0849ad8502e121905c0274aa19aa75f3e343f38c')

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
