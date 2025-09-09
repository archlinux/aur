# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-xai-sdk
_name=${pkgname#python-}
pkgver=1.1.0
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
source=("https://files.pythonhosted.org/packages/source/x/xai_sdk/xai_sdk-$pkgver.tar.gz")
sha256sums=('dd5b9309b46d4270843025637f65c0c246b70c9c321aca6cb54f3201238685f8')

build() {
    cd "$srcdir/xai_sdk-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/xai_sdk-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}