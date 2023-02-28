# Maintainer: zhullyb <zhullyb [at] outlook dot com>

pkgname=onedrivegui
pkgver=1.0.2
pkgrel=1
pkgdesc="A simple GUI for OneDrive Linux client, with multi-account support."
license=("GPL")
depends=("pyside6" "python-requests" "onedrive-abraunegg" "qt6-webengine")
makedepends=()
conflicts=("onedrivegui-git")
provides=("onedrivegui")
arch=("any")
url="https://github.com/bpozdena/OneDriveGUI"
source=("https://github.com/bpozdena/OneDriveGUI/archive/refs/tags/v${pkgver}.tar.gz"
        "onedrivegui.desktop")
sha256sums=('3dcba012610696dda0386eff0937748a637754184fb53bd2ed1cbc9d29062c2b'
            'c531f57c3c8424f265c0aad2e93260eab071d066d75de2f7eebb47e41c644267')

package(){
    cd "${srcdir}/OneDriveGUI-${pkgver}"
    mkdir -p "${pkgdir}/usr/lib/OneDriveGUI"
    mkdir -p "${pkgdir}/usr/bin"
    cp -r src/{resources,ui} "${pkgdir}/usr/lib/OneDriveGUI"
    install -Dm644 src/resources/images/OneDriveGUI.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/OneDriveGUI.png"
    install -Dm644 "${srcdir}/onedrivegui.desktop" "${pkgdir}/usr/share/applications/onedrivegui.desktop"
    install -Dm755 src/OneDriveGUI.py "${pkgdir}/usr/lib/OneDriveGUI/OneDriveGUI.py"
    ln -sf /usr/lib/OneDriveGUI/OneDriveGUI.py "${pkgdir}/usr/bin/onedrivegui"
}
