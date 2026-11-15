# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-protocol
pkgname=python-$_name
pkgver=2.0.0
pkgrel=1
pkgdesc='Python protocol stubs for LiveKit.'
arch=('any')
_repo='https://github.com/livekit/python-sdks'
url="$_repo/tree/main/$_name"
license=('Apache-2.0')
depends=('python'
         'python-protobuf')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/protocol-v$pkgver.tar.gz")
sha256sums=('30ddd16011d44ee978a09b5c9d136be8a037436e5ba2b6922356e74b188b508d')

build() {
  cd "python-sdks-protocol-v$pkgver"
  python -m build --wheel --no-isolation $_name
}

package() {
  cd "python-sdks-protocol-v$pkgver"
  python -m installer --destdir="$pkgdir" $_name/dist/*.whl
}
