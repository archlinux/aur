pkgname=jddiff
pkgver=1.2
pkgrel=1
pkgdesc="A graphical cross platform diff viewer"
arch=("any")
url="https://gitlab.com/JakobDev/jdDiff"
license=("GPL3")
depends=("python" "python-setuptools" "python-pyqt6")
makedepends=("qt5-tools")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/jdDiff/-/archive/${pkgver}/jdDiff-${pkgver}.tar.gz")
sha256sums=("3c61f1ec17f4fb80ea0bb219e601170c0241841fcb1cf4225a8d15f6e801ffae")

package() {
    cd "jdDiff-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 "jdDiff/Icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.gitlab.JakobDev.jdDiff.svg"
    install -Dm644 "Data/com.gitlab.JakobDev.jdDiff.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"
    install -Dm644 "Data/com.gitlab.JakobDev.jdDiff.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
} 
