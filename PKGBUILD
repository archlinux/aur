# Maintainer: rakoo <m@rako.space>
pkgname=deface
pkgver=1.5.0
pkgrel=1
pkgdesc="Photo and Video anonymization by face detection "
arch=("any")
url="https://github.com/ORB-HD/deface"
license=("MIT")
depends=(python-imageio python-imageio-ffmpeg python-numpy python-tqdm python-scikit-image python-opencv)
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(
	"https://github.com/ORB-HD/deface/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=(
    "6c728a7b0fbb9138352e4ce3f6d47f96650d01ae8befa858172c9b41f7d47ddc"
)

build() {
	export SETUPTOOLS_SCM_PRETEND_VERSION=1.5.0
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

