pkgname="figma-linux"
pkgver="0.6.1"
pkgrel="10"
pkgdesc="The collaborative interface design tool. Unofficial Figma desktop client for Linux"
arch=("x86_64")
url="https://github.com/Figma-Linux/figma-linux"
license=('GPL2')
conflicts=("figma-bin")
replaces=("figma-bin")
source=("https://github.com/Figma-Linux/figma-linux/releases/download/v${pkgver}/figma-linux-${pkgver}.pacman")
noextract=("figma-linux-${pkgver}.pacman")
sha256sums=("9618a2694acde6af5cc4d95346f5d2694cffb8fd73b34667ef42aaea9baed534")

prepare() {
  cd "${srcdir}"
  pacman -U "figma-linux-${pkgver}.pacman"
}

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/figma-linux" "${pkgdir}/usr/bin/figma-linux"
}
