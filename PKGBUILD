# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Helnandorovitch lpanhirsch@gmail.com
pkgname=myftb-launcher
pkgver=1.1.10
pkgrel=1
epoch=1
pkgdesc="A fork of the SKCraft launcher for the MyFTB servers."
arch=('x86_64')
url="https://torch.myftb.de/launcher"
license=('LGPL3')
depends=('java-runtime=8' 'xorg-xrandr' 'ttf-font' 'libzip')
source=("$pkgname"
        "${pkgname}.jar"::"http://packs.myftb.de/launcher/MyFTB-Launcher.jar"
        "${pkgname}.desktop"
        "${pkgname}.png")
noextract=("${pkgname}.jar")
sha256sums=('0b09885f261f3d4dd6c770f7cbadb18f75b72aadf5a78ba8ea6ad0810162b013'
            '0faec77091e326f46f9e9d6673f56daa809a33b3a7414b809d308e12ab69c6b5'
            'fe08f858ade9efd13bd06a631465628c4a4849e5fd643e3f87e4bb93eca29991'
            'c54ec9d14c5feac305ef40e98b19f68649d24c00dfa35e6ed9ec7d8c24e6899d')
package() {
  install -Dm755 "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.jar" "${pkgdir}/usr/share/${pkgname}/${pkgname}.jar"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
