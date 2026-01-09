pkgname=python-meshtastic
pkgver=2.7.6
pkgrel=1
pkgdesc='The Python CLI and API for talking to Meshtastic devices'
arch=(any)
url='https://github.com/meshtastic/python'
license=(GPL-3.0-only)
depends=(
    python
    python-bleak
    python-packaging
    python-protobuf
    python-pypubsub
    python-pyserial
    python-requests
    python-tabulate
)
optdepends=(
    python-argcomplete
    python-pandas
    python-pyqrcode
    python-wcwidth
)
makedepends=(
    python-build
    python-installer
    python-poetry-core
)

source=("https://github.com/meshtastic/python/archive/refs/tags/$pkgver.tar.gz")
b2sums=('53b8d0ee1bcebb0cf8a86d58ab9c74533a99ded21aeaa2e941dea00340ea196c5b623db631a2b9520ffdc96c1e8692a94b24e682598f215bf7e5e6427a7c28c6')

build() {
  cd "python-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "python-$pkgver"
  python -m installer -d "$pkgdir" dist/*.whl
}
