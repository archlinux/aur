# Maintainer: Ivo Maceira <ivomaceira at gmail dot com>
pkgname=python-deepgram-sdk
pkgver=3.11.0  # https://pypi.org/project/deepgram-sdk/
pkgrel=2
pkgdesc="Official Deepgram SDK for Python"
arch=("any")
url="https://github.com/deepgram/deepgram-python-sdk"
license=("MIT")
depends=(
  "python"
  "python-aiofiles"
  "python-aiohttp"
  "python-deprecation"
  "python-httpx"
  "python-typing_extensions"
  "python-websockets"
)
optdepends=(
  "python-aenum: required for deepgram-sdk"
  "python-dataclasses-json: required for deepgram-sdk"
)
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel")
source=("https://files.pythonhosted.org/packages/45/e8/7eb68bfd1b18ec9141d13cf448c257d601a12139f4afe11e4e24553ade49/deepgram_sdk-$pkgver.tar.gz")
sha256sums=("d929149ae7ded113e5736e87a5102523bae6e88203d5bfc308ebb01e78a2a032")

build() {
	cd "deepgram_sdk-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
	cd "deepgram_sdk-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
