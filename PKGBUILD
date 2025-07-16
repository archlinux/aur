# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-xai-sdk
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc="The official Python SDK for xAI's APIs"
arch=(any)
url="https://github.com/xai-org/xai-sdk-python"
license=(Apache-2.0)
groups=()
depends=(python-aiohttp python-grpcio python-packaging python-protobuf python-pydantic python-requests)
optdepends=()
makedepends=(python-build python-installer python-wheel)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/04/96/bde4e511f14577106d6060d57090e529b530828fe959adc6b5d67a91db42/xai_sdk-$pkgver.tar.gz")
sha256sums=('f1a989f6feb74c06598a53ac94c378c525e0b44792e4eb3996e16d6323b6f617')

build() {
    cd "$srcdir/xai_sdk-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/xai_sdk-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}