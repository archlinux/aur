# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-protocol
pkgname=python-$_name
pkgver=2.0.1
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
sha256sums=('0b032c67b3cfbba4b59ff6f3ee5b386f39dda80531330385b8c2af352eeb446a')

build() {
  cd "python-sdks-protocol-v$pkgver"
  python -m build --wheel --no-isolation $_name
}

package() {
  cd "python-sdks-protocol-v$pkgver"
  python -m installer --destdir="$pkgdir" $_name/dist/*.whl
}
