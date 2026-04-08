# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-xai-sdk
_name=${pkgname#python-}
pkgver=1.11.0
pkgrel=1
pkgdesc="The official Python SDK for xAI's APIs"
arch=(any)
url="https://github.com/xai-org/xai-sdk-python"
license=(Apache-2.0)
groups=()
depends=(python-aiohttp python-googleapis-common-protos python-grpcio python-opentelemetry-sdk python-packaging python-protobuf python-pydantic python-requests)
optdepends=()
makedepends=(python-build python-installer python-hatchling python-hatch-fancy-pypi-readme)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/x/xai_sdk/xai_sdk-$pkgver.tar.gz")
sha256sums=('ca87a830d310fb8e06fba44fb2a8c5cdf0d9f716b61126eddd51b7f416a63932')

build() {
    cd "$srcdir/xai_sdk-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/xai_sdk-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
