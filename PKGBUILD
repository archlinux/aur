pkgname=jdappdataedit
pkgver=5.1
pkgrel=1
pkgdesc="A graphical Program to create and edit AppStream files"
arch=("any")
url="https://gitlab.com/JakobDev/jdAppdataEdit"
license=("GPL3")
depends=("python" "python-setuptools" "python-pyqt6" "python-lxml" "python-requests" "python-packaging" "appstream")
makedepends=("qt5-tools")
optdepends=("python-desktop-entry-lib: Create AppStream files from .desktop files" "appstream-glib: Validate with appstream-util")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/jdAppdataEdit/-/archive/${pkgver}/jdAppdataEdit-${pkgver}.tar.gz")
sha256sums=("042704a0b5397434137a24c95aa2d39f729380ed1b652235f2edf5e90c12db20")

package() {
    cd "jdAppdataEdit-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 "jdAppdataEdit/Icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.gitlab.JakobDev.jdAppdataEdit.svg"
    install -Dm644 "Deploy/com.gitlab.JakobDev.jdAppdataEdit.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"
    install -Dm644 "Deploy/com.gitlab.JakobDev.jdAppdataEdit.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
} 
