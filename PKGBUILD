# Maintainer: Jim Driessen <aur@driessen.li>
# Contributor: Hauke Ingwersen <hauing@pm.me>
# Contributor: Robert Csordas <xdever@gmail.com>

pkgname=mutagen.io-bin
pkgver=0.18.1
pkgrel=1
epoch=
arch=('i386' 'x86_64' 'aarch64' 'armv7h')
url="https://mutagen.io/"
changelog=
license=('MIT')
source_x86_64=("https://github.com/mutagen-io/mutagen/releases/download/v${pkgver}/mutagen_linux_amd64_v${pkgver}.tar.gz")
source_i386=("https://github.com/mutagen-io/mutagen/releases/download/v${pkgver}/mutagen_linux_386_v${pkgver}.tar.gz")
source_aarch64=("https://github.com/mutagen-io/mutagen/releases/download/v${pkgver}/mutagen_linux_arm64_v${pkgver}.tar.gz")
source_armv7h=("https://github.com/mutagen-io/mutagen/releases/download/v${pkgver}/mutagen_linux_arm_v${pkgver}.tar.gz")
sha256sums_i386=('58c2bdfb148da219569fb0ddb84aec2e3c121b8538f356dc78c73a989d67c4b6')
sha256sums_x86_64=('7735286c778cc438418209f24d03a64f3a0151c8065ef0fe079cfaf093af6f8f')
sha256sums_aarch64=('bcba735aebf8cbc11da9b3742118a665599ac697fa06bc5751cac8dcd540db8a')
sha256sums_armv7h=('441599fc7f8212fa009d8a829507b3879d11849dd78fcc1f3a773bfa1bc97bb9')
pkgdesc="Code synchronization tool for remote development."

prepare() {
  tar -xvf mutagen_linux_*_v${pkgver}.tar.gz
}

package() {
  install -D -m755 ${srcdir}/mutagen ${pkgdir}/opt/mutagen/mutagen
  install -D -m644 ${srcdir}/mutagen-agents.tar.gz ${pkgdir}/opt/mutagen/mutagen-agents.tar.gz
  mkdir -p ${pkgdir}/usr/bin/
  ln -s /opt/mutagen/mutagen ${pkgdir}/usr/bin/
}
