pkgname=jdsimpleautostart
pkgver=1.1
pkgrel=1
pkgdesc="Edit autostart entries"
arch=("any")
url="https://gitlab.com/JakobDev/jdSimpleAutostart"
license=("GPL3")
depends=("python" "python-setuptools" "python-pyqt6" "python-desktop-entry-lib")
makedepends=("qt5-tools")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/jdSimpleAutostart/-/archive/${pkgver}/jdSimpleAutostart-${pkgver}.tar.gz")
sha256sums=("4a6bef0181da32f8a3717060ffe724f8c8ad5f2e245c5dc7380f6dfe95c280c0")

package() {
    cd "jdSimpleAutostart-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 "jdSimpleAutostart/Icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.gitlab.JakobDev.jdSimpleAutostart.svg"
    install -Dm644 "deploy/io.gitlab.JakobDev.jdSimpleAutostart.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"
    install -Dm644 "deploy/io.gitlab.JakobDev.jdSimpleAutostart.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
} 
