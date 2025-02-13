pkgname=hello-minecraft-launcher-dev-bin
pkgver=3.6.11.267
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
sha256sums=('f5fc88215b66e7c5ba9841b944f123c640280665717fdc2872397d4bda86eabe'
            '1c63a1f6ce4d821c1d6876876f7bce67befaf068bc81468f1c60807c77103cd4'
            'd4e56ae2e8c0d991dba01ef3124ef4d38918825f58728338a8bab5e78319306a'
            '0bbac6ef94a59adfde2c20e1e6493cf12f950185214cc101a41cca5255b42bd1')
package() {
  install -Dm755 "start-hello-minecraft-launcher-dev.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "hello-minecraft-launcher-dev.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "hello-minecraft-launcher-dev.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
}
