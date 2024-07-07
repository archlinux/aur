# Maintainer: Butui Hu <hot123tea123@gmail.com>

_pkgname=aiortc
pkgname=python-aiortc
pkgver=1.9.0
pkgrel=1
pkgdesc='WebRTC and ORTC implementation for Python using asyncio'
arch=('x86_64')
url='https://github.com/aiortc/aiortc'
license=('BSD-3-Clause')
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
sha512sums=('fd411a46ed2cdcc4bfcb190d0e33bbf23ac0658e47152a846e5d22cf8175f808d4d4435526682a2f27c429d83dd364c5b29c15f5b8fadf95a2bb790cb67f1266')

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
