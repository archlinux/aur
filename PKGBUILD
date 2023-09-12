# Maintainer: Oystein Sture <oysstu a.t gmail.com>
# Contributor: 

pkgname=python-imageio-ffmpeg
pkgver=0.4.9
pkgrel=1
pkgdesc="FFMPEG wrapper for Python"
arch=("any")
license=("BSD")
url="https://github.com/imageio/imageio-ffmpeg"
depends=('python' 'ffmpeg')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("git+https://github.com/imageio/imageio-ffmpeg.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "imageio-ffmpeg"
    python -m build --wheel --no-isolation
}

package() {
    cd "imageio-ffmpeg"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-imageio-ffmpeg/LICENSE"
}
