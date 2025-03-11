# Maintainer: Oystein Sture <oysstu a.t gmail.com>
# Contributor: 

pkgname=python-imageio-ffmpeg
pkgver=0.6.0
pkgrel=2
pkgdesc='FFMPEG wrapper for Python'
arch=('any')
license=('BSD-2-Clause')
url='https://github.com/imageio/imageio-ffmpeg'
depends=('python' 'ffmpeg')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/imageio/imageio-ffmpeg/archive/v${pkgver}.tar.gz")
sha256sums=('9c671e814b6d78680db71b1fab88ae20d9305f38808b8aaf57dae53fd969ad9d')

build() {
    cd "imageio-ffmpeg-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "imageio-ffmpeg-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-imageio-ffmpeg/LICENSE"
}
