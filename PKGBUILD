pkgname=jdeolconverter
pkgver=1.1
pkgrel=1
pkgdesc="Converts End of Line of all files in a directory"
arch=("any")
url="https://gitlab.com/JakobDev/jdEolConverter"
license=("GPL3")
depends=("python" "python-setuptools" "python-pyqt6")
makedepends=("qt5-tools")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/jdEolConverter/-/archive/${pkgver}/jdEolConverter-${pkgver}.tar.gz")
sha256sums=("968ea2f61fe11ad6f6dbd457f72c826392adb0c30b0b881085786fd7d6a3aa7c")

package() {
    cd "jdEolConverter-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 "jdEolConverter/Icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.gitlab.JakobDev.jdEolConverter.svg"
    install -Dm644 "com.gitlab.JakobDev.jdEolConverter.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"
    install -Dm644 "com.gitlab.JakobDev.jdEolConverter.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
} 
