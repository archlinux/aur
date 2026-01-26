# Maintainer: Ivo Maceira <ivomaceira at gmail dot com>
pkgname=python-deepgram-sdk
pkgver=5.3.1  # https://pypi.org/project/deepgram-sdk/
pkgrel=3
pkgdesc="Official Deepgram SDK for Python"
arch=("any")
url="https://github.com/deepgram/deepgram-python-sdk"
license=("MIT")
depends=(
  "python"
  "python-httpx"
  "python-pydantic"
  "python-typing_extensions"
  "python-websockets"
)
optdepends=()
makedepends=("python-build" "python-poetry")
source=("https://files.pythonhosted.org/packages/b8/76/ba0f925f955e171ed789c7f3626251c78786cce09ddc122ac92fe1cc508d/deepgram_sdk-5.3.1.tar.gz")
sha256sums=("87336787c3072d324a0fa412364668adec73175a9f6f0fdd4f91983f734c2842")

build() {
	cd "deepgram_sdk-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
	cd "deepgram_sdk-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
