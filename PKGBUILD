# Maintainer: Oystein Sture <oysstu a.t gmail.com>
# Contributor: 

pkgname=python-imageio-ffmpeg
pkgver=0.7.0
pkgrel=1
pkgdesc='FFMPEG wrapper for Python'
arch=('any')
license=('BSD-2-Clause')
url='https://github.com/imageio/imageio-ffmpeg'
depends=('python' 'ffmpeg')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/imageio/imageio-ffmpeg/archive/v${pkgver}.tar.gz")
sha256sums=('5e9334249b7eb82e3a455e455a9b24635c232a9d234efa17b9acb734aec9b0c8')

build() {
    cd "imageio-ffmpeg-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "imageio-ffmpeg-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-imageio-ffmpeg/LICENSE"
}
