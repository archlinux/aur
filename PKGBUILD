# Maintainer: Oystein Sture <oysstu a.t gmail.com>
# Contributor: 

pkgname=python-imageio-ffmpeg
pkgver=0.8.1
pkgrel=1
pkgdesc='FFMPEG wrapper for Python'
arch=('any')
license=('BSD-2-Clause')
url='https://github.com/imageio/imageio-ffmpeg'
depends=('python' 'ffmpeg')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/imageio/imageio-ffmpeg/archive/v${pkgver}.tar.gz")
sha256sums=('09ea6c038cd4eab618f38b67c83bad5be941ac6474d0fab824ebf8c79b12674f')

build() {
    cd "imageio-ffmpeg-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "imageio-ffmpeg-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-imageio-ffmpeg/LICENSE"
}
