pkgname=jdanimatedimageeditor
pkgver=1.4
pkgrel=1
pkgdesc="A simple program for creating animated Images"
arch=("any")
url="https://codeberg.org/JakobDev/jdAnimatedImageEditor"
license=("GPL3")
depends=("python" "python-pyqt6" "python-pillow" "python-requests" "ffmpeg")
makedepends=("qt5-tools" "python-setuptools" "python-build" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdAnimatedImageEditor/archive/${pkgver}.tar.gz")
sha256sums=("5ec1b348555f06ff3f0a47055b5c56fb204d42fcbbc161c33e526fe38266e33c")

build() {
      cd "jdanimatedimageeditor"
      python -m build --wheel --no-isolation
}

package() {
    cd "jdanimatedimageeditor"
    python -m installer --destdir "$pkgdir" dist/*.whl
    python install-unix-datafiles.py --prefix "${pkgdir}/usr"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
} 
