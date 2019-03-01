# Maintainer: Oystein Sture <oysstu a.t gmail.com>
# Contributor: 

pkgname=python-imageio-ffmpeg
pkgver=0.2.0
pkgrel=1
pkgdesc="FFMPEG wrapper for Python"
arch=("any")
license=("BSD")
url="https://github.com/imageio/imageio-ffmpeg"
depends=('python' 'ffmpeg')
makedepends=('python-setuptools')
source=("https://github.com/imageio/imageio-ffmpeg/archive/v${pkgver}.tar.gz")
sha256sums=("9998124f3c78faebbe98327fc18c3069789d77f32dd42e4480f0b84e8809138e")

build() {
    cd "imageio-ffmpeg-${pkgver}"
    python setup.py build
}

package() {
    cd "imageio-ffmpeg-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-imageio-ffmpeg/LICENSE"
}
