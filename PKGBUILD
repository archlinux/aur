pkgname=python-meshtastic
pkgver=2.7.7
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
b2sums=('95062b057341ff81384a8db06938f7baf7e05badecf2cc927ee149d56d65fc49f67991698cc158d76c60394df1a76193eaf49111f8c06b507d6270c601e5ce31')

build() {
  cd "python-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "python-$pkgver"
  python -m installer -d "$pkgdir" dist/*.whl
}
