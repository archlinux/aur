# Maintainer: Oystein Sture <oysstu a.t gmail.com>
# Contributor: 

pkgname=python-imageio-ffmpeg
pkgver=0.4.1
pkgrel=1
pkgdesc="FFMPEG wrapper for Python"
arch=("any")
license=("BSD")
url="https://github.com/imageio/imageio-ffmpeg"
depends=('python' 'ffmpeg')
makedepends=('python-setuptools')
source=("https://github.com/imageio/imageio-ffmpeg/archive/v${pkgver}.tar.gz")
sha256sums=('83c03933ed519be458bd8f227c27b9f95a99cb1a35c92ffee584eea2978a85b7')

build() {
    cd "imageio-ffmpeg-${pkgver}"
    python setup.py build
}

package() {
    cd "imageio-ffmpeg-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-imageio-ffmpeg/LICENSE"
}
