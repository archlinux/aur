# Maintainer: asm0dey <me@asm0dey.site>

pkgname=audiobookconverter-bin
pkgver=6.5.2
pkgrel=2
epoch=
pkgdesc="Improved AudioBookConverter based on freeipodsoftware release (mp3 to m4b converter)"
arch=("x86_64")
url="https://github.com/yermak/AudioBookConverter"
license=('GPL2')
groups=()
depends=()
provides=('audiobookconverter')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://github.com/yermak/AudioBookConverter/releases/download/version_${pkgver}/AudioBookConverter-static-binaries-${pkgver}.tar.gz"
  "audiobookconverter-AudioBookConverter.desktop")
sha512sums=('e5262281e268b017be8bf3ab96cd3f1de7ac3bf58164d6b9b47059cd2967b6e332f923a2398b4c2d18061a7e1794d977d7d6d311b7670d426da3c551a4ebbcab'
  '8d17bb905863faf2886901b1baa45e3434fd1658715198a120a9b0407adfcd225b47b43f887dd61601b15cc1d889d14c20ba0bbc519c48b866fc066d8174db11')
package() {
  install -dm0755 "${pkgdir}/opt/"

  cp -r "${srcdir}/AudioBookConverter" "${pkgdir}/opt/audiobookconverter"

  install -dm0755 "${pkgdir}/usr/bin"
  ln -sf "/opt/audiobookconverter/bin/AudioBookConverter" "${pkgdir}/usr/bin/audiobookconverter"

  cp -dpr --no-preserve=ownership "${pkgdir}/opt/audiobookconverter/lib" "${pkgdir}/usr/lib"

  install -Dm644 "${srcdir}/audiobookconverter-AudioBookConverter.desktop" "${pkgdir}/usr/share/applications/audiobookconverter.desktop"
}
