# Maintainer: Lukas Lipinsky <6032558+Mr-Tao@users.noreply.github.com>

pkgname=python-androidtvremote2
pkgver=0.3.1
pkgrel=1
pkgdesc='Python implementation of the Android TV Remote protocol v2'
arch=('any')
url='https://github.com/tronikos/androidtvremote2'
license=('Apache-2.0')
depends=(
  'python-aiofiles'
  'python-cryptography'
  'python-protobuf'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/a/androidtvremote2/androidtvremote2-$pkgver.tar.gz")
sha256sums=('11f8e33d76d8c539d26fd3002c423d21ca9264a8281bf895c0f169dab513fca1')

build() {
  cd "androidtvremote2-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "androidtvremote2-$pkgver"
  pytest -q
}

package() {
  cd "androidtvremote2-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
