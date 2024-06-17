# Maintainer: Grayer0113 <grayer0113@outlook.com>

pkgname=hmcl-bin-dev
_ver=3.5.8.249
pkgver=${_ver}
pkgrel=1
pkgdesc="A Minecraft Launcher which is multi-functional, cross-platform and popular.(development version)"
arch=('any')
url="https://github.com/HMCL-dev/HMCL"
license=('GPL3')
depends=('java-runtime' 'gtk2')
optdepends=('java-openjfx')
conflicts=('hmcl-dev' 'hmcl-dev-bin' 'hmcl-bin')
source=("hmcl.desktop"
        "hmcl-launch-script"
        "hmcl-icon.png::https://raw.githubusercontent.com/HMCL-dev/HMCL/main/HMCL/image/hmcl.png"
        "${pkgname}-${pkgver}-${pkgrel}.jar::https://github.com/HMCL-dev/HMCL/releases/download/v${pkgver}/HMCL-${pkgver}.jar"
        "LICENSE::https://raw.githubusercontent.com/HMCL-dev/HMCL/main/LICENSE")
sha256sums=('e2614d6d230df98368394eea8c4ac9b0be6ad8b2c84f056b21e460cd26635a67'
            '1f266df2c05b1f157d95e22742c42815953f701570bb703298e5e28a9815475a'
            'd4e56ae2e8c0d991dba01ef3124ef4d38918825f58728338a8bab5e78319306a'
            '0154c4f510f40ca2aeba63df6b998f40c59dc787e50dec9e39e6baccbf2b7ae7'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

noextract=("${pkgname}-${pkgver}-${pkgrel}.jar")

package() {
  install -Dm644 "hmcl.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm755 "hmcl-launch-script" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "hmcl-icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm644 "${pkgname}-${pkgver}-${pkgrel}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -Dm644 "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
