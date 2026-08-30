# Maintainer: NebulaTechs <NebulaTechs@users.noreply.github.com>
pkgname=pcln-bin
pkgver=1.4.13
pkgrel=1
pkgdesc="一个基于 PCL-CE 开发的 Minecraft 启动器 (PCL N Edition)"
arch=('x86_64')
url="https://github.com/PCL-N-Edition/PCL-N"
license=('Apache-2.0')
depends=('hicolor-icon-theme' 'glibc')
provides=('pcl-n')
conflicts=('pcl-n')
source=("https://github.com/PCL-N-Edition/PCL-N/releases/download/v${pkgver}/PCL_N_Release_linux-x64_NoRuntime_Installer.deb")
sha256sums=('35955df7da39acee259cd5ed1688f208ded9607cefd3d47df734913deff81c6d')
options=('!strip')

package() {
  bsdtar -Oxf "${srcdir}/PCL_N_Release_linux-x64_NoRuntime_Installer.deb" 'data.tar*' \
    | bsdtar -C "${pkgdir}" --use-compress-program='unzstd' -xf -
}