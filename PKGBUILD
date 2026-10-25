# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-protocol
pkgname=python-$_name
pkgver=1.1.28
pkgrel=1
pkgdesc='Python protocol stubs for LiveKit.'
arch=('any')
_repo='https://github.com/livekit/python-sdks'
url="$_repo/tree/main/$_name"
license=('Apache-2.0')
depends=('python' 'python-protobuf')
makedepends=('python-hatchling' 'python-build' 'python-installer')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/protocol-v$pkgver.tar.gz")
sha256sums=('51a81355615d68d807e9fe31c9bddec0cf4e46d79135efb5a6643ed4464c0f39')

build() {
  cd "python-sdks-protocol-v$pkgver"
  python -m build --wheel --no-isolation $_name
}

package() {
  cd "python-sdks-protocol-v$pkgver"
  python -m installer --destdir="$pkgdir" $_name/dist/*.whl
}
