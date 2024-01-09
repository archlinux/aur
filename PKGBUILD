# Mantainer: sgar < swhaat at github >

pkgname=python-chacha20poly1305-reuseable
_basename=chacha20poly1305-reuseable
pkgver=v0.12.0
pkgrel=1
pkgdesc='A reusable version of ChaCha20Poly1305 for use with cryptography and asyncio'
url=https://github.com/bdraco/chacha20poly1305-reuseable
license=(APACHE)
depends=(
  python
  python-poetry
  python-cryptography
)
makedepends=(
  cython
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
_tag=134390ab10534872e59fcbceefdf4c4f8f4ca219
source=(git+${url}#tag=${_tag})
b2sums=('SKIP')
arch=(any)

pkgver() {
  cd ${_basename}
  git describe --tags
}

build() {
  cd ${_basename}
  python -m build -wn
}

package() {
  python -m installer -d "${pkgdir}" ${_basename}/dist/*.whl
  install -Dm 644 ${_basename}/LICENSE -t "${pkgdir}"/usr/share/licenses/python-chacha20poly1305-reuseable/
}
