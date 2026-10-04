# Maintainer: NebulaTechs <NebulaTechs@users.noreply.github.com>
pkgname=nexacl-bin
pkgver=2.0.0.alpha.5
pkgrel=1
pkgdesc="Nexa Minecraft Launcher - PCL-N 的继任者 (C++/Qt 重写版)"
arch=('x86_64')
url="https://github.com/Nexa-MC/PCL-N"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'zlib' 'fontconfig' 'libx11' 'libice' 'libsm' 'libsecret')
provides=('nexa' 'nexacl')
conflicts=('nexa' 'nexacl')
source=("https://github.com/Nexa-MC/PCL-N/releases/download/v${pkgver}/Nexa-${pkgver}-linux-x64.deb")
sha256sums=('3893cf473e07a82b9f1de4a06f6f43e2568b5acfcb5e5c73741725e00a6111ff')
options=('!strip')

package() {
  bsdtar -Oxf "${srcdir}/Nexa-${pkgver}-linux-x64.deb" 'data.tar*' \
    | bsdtar -C "${pkgdir}" -xf -
  find "${pkgdir}" -type f \( -name '*.pdb' -o -name '*.dbg' \) -delete
  rm -rf "${pkgdir}/usr/share/doc"
}