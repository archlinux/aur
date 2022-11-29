pkgname=jdanimatedimageeditor
pkgver=1.3
pkgrel=1
pkgdesc="A simple program for creating animated Images"
arch=("any")
url="https://gitlab.com/JakobDev/jdAnimatedImageEditor"
license=("GPL3")
depends=("python" "python-setuptools" "python-pyqt6" "python-pillow" "python-requests" "ffmpeg")
makedepends=("qt5-tools")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/jdAnimatedImageEditor/-/archive/${pkgver}/jdAnimatedImageEditor-${pkgver}.tar.gz")
sha256sums=("83a12329006717a56ae0d0efb52ffc023a6e12e0fd7f3cd58b0f3bb41992fc5c")

package() {
    cd "jdAnimatedImageEditor-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 "jdAnimatedImageEditor/Icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.gitlab.JakobDev.jdAnimatedImageEditor.svg"
    install -Dm644 "deploy/com.gitlab.JakobDev.jdAnimatedImageEditor.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"
    install -Dm644 "deploy/com.gitlab.JakobDev.jdAnimatedImageEditor.desktop" -t "${pkgdir}/usr/share/applications"
} 
