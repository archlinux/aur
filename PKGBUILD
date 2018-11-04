# Maintainer: Rico Sta. Cruz <hello@ricostacruz.com>
pkgname="figma-linux-bin"
pkgver="0.2.2"
pkgrel="2"
pkgdesc="Unofficial Figma desktop client for Linux"
arch=("x86_64")
url="https://github.com/ChugunovRoman/figma-linux"
license=("MIT")
source=("https://github.com/ChugunovRoman/figma-linux/releases/download/v$pkgver/figma-linux-$pkgver.pacman")
sha256sums=("b29a1fa43fb5e34c6c5f032ba6e673f167914bfaac2d9a70a620d63e105f9652")

package() {
  mv "${srcdir}/usr" "${pkgdir}"

  mkdir -p "${pkgdir}/opt"
  mv "${srcdir}/opt/figma-linux" "${pkgdir}/opt/${pkgname}"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/figma-linux" "${pkgdir}/usr/bin/figma-linux"
}
