# Maintainer: Nyaacinth <nyaacinth_liota@outlook.com>
pkgname=synthv-studio-bin
pkgver=1
pkgrel=1
pkgdesc="Synthesizer V studio by Dreamtonics"
arch=("x86_64")
url="https://dreamtonics.com/synthesizerv"
license=(custom)
depends=()
provides=("synthv-studio")
conflicts=()
source=("synthv-studio.sh"
        "synthv-studio.png"
        "synthv-studio.desktop")
sha256sums=("83a419a9c281fbca976bc683ba584a7e0bf4ac5cc249c3a0ed0cfff92f2215af"
            "f0f0180bbd5a029655089c5f8d5948c093622dd978e8aa6a4c47689b5936351b"
            "710f95ca38ab0e69c0431feb7f323bf84b4b4b822248a465ed5e525b36070871")

package() {
  read -p "Please input the path to your Synthesizer V Studio distribution (the zip file you downloaded) on the filesystem: " SVDIST
  install -Dm644 "${SVDIST}" "${pkgdir}/opt/synthv-studio/dist.zip"
  install -Dm644 "${srcdir}/synthv-studio.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/synthv-studio.png"
  install -Dm755 "${srcdir}/synthv-studio.sh" "${pkgdir}/usr/bin/synthv-studio"
  install -Dm755 "${srcdir}/synthv-studio.desktop" "${pkgdir}/usr/share/applications/synthv-studio.desktop"
}
