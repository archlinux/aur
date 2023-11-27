# Mantainer: sgar < swhaat at github >

pkgname=python-chacha20poly1305-reuseable
_basename=chacha20poly1305-reuseable
pkgver=v0.11.0
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
_tag=96d43fe790f45fb36812bab128a1fce0a421e014
source=(git+${url}#tag=${_tag})
b2sums=(SKIP)
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
