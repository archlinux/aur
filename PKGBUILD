pkgname=hello-minecraft-launcher-dev-bin
pkgver=3.6.11.266
pkgrel=1
pkgdesc="HMCL is an open-source, cross-platform Minecraft launcher that supports Mod Management, Game Customizing, ModLoader Installing (Forge, NeoForge, Fabric, Quilt, LiteLoader, and OptiFine), Modpack Creating, UI Customization, and more."
arch=('any')
url="https://github.com/HMCL-dev/HMCL"
license=('GPL3')
depends=('java-runtime' 'gtk2')
optdepends=('java-openjfx: to use system OpenJFX libraries'
            'glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'xorg-xrandr: for older minecraft versions'
            'flite: minecraft voice narration'
)
backup=("usr/bin/${pkgname}")
source=("hello-minecraft-launcher-dev.desktop"
        "start-hello-minecraft-launcher-dev.sh"
        "hello-minecraft-launcher-dev.png"
        "${pkgname}-${pkgver}.jar::https://github.com/HMCL-dev/HMCL/releases/download/v${pkgver}/HMCL-${pkgver}.jar")
sha256sums=('dfaa4f501609c3297740d6ed58198891bbd4bd0fdbaa1269f1678d1c01b3ded1'
            '1c63a1f6ce4d821c1d6876876f7bce67befaf068bc81468f1c60807c77103cd4'
            'd4e56ae2e8c0d991dba01ef3124ef4d38918825f58728338a8bab5e78319306a'
            '38ccab521a8393d489b4cf62c74910494ce41ce4360f4d771e71a2cdb1aa87bd')
package() {
  install -Dm755 "start-hello-minecraft-launcher-dev.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "hello-minecraft-launcher-dev.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "hello-minecraft-launcher-dev.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
}