# Maintainer: Oystein Sture <oysstu a.t gmail.com>
# Contributor: 

pkgname=python-imageio-ffmpeg
pkgver=0.5.1
pkgrel=2
pkgdesc="FFMPEG wrapper for Python"
arch=("any")
license=("BSD")
url="https://github.com/imageio/imageio-ffmpeg"
depends=('python' 'ffmpeg')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/imageio/imageio-ffmpeg/archive/v${pkgver}.tar.gz")
sha256sums=('6169e935f780088afa2ae057e7e0154fc4829ab61f47e76e259166c8cbd2812c')

build() {
    cd "imageio-ffmpeg-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "imageio-ffmpeg-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-imageio-ffmpeg/LICENSE"
}
