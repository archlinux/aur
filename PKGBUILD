pkgname=jdminecraftlauncher
pkgver=3.2
pkgrel=1
pkgdesc="A oldstyle Minecraft launcher written in Python"
arch=("any")
url="https://gitlab.com/JakobDev/jdMinecraftLauncher"
license=("GPL3")
depends=("python"
         "python-setuptools"
         "python-pyqt6"
         "python-pyqt6-webengine"
         "python-requests"
         "python-minecraft-launcher-lib"
         "python-jdtranslationhelper")
makedepends=("gendesk")
optdepends=("gamemode: Run Minecraft in gamemode")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/jdMinecraftLauncher/-/archive/${pkgver}/jdMinecraftLauncher-${pkgver}.tar.gz")
sha256sums=("2eea914e24ed8672cb80a9a724d56e6271d3922fd5ef79f195ad84e39880ad07")

package() {
    cd "jdMinecraftLauncher-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 "jdMinecraftLauncher/Icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.gitlab.JakobDev.jdMinecraftLauncher.svg"
    install -Dm644 "deploy/com.gitlab.JakobDev.jdMinecraftLauncher.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"
    install -Dm644 "deploy/com.gitlab.JakobDev.jdMinecraftLauncher.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
