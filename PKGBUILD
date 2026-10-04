# Maintainer: NebulaTechs <NebulaTechs@users.noreply.github.com>
pkgname=pcln-bin
pkgver=1.4.14
pkgrel=2
pkgdesc="Minecraft 启动器 (PCL-N 1.x 系列, 已被 Nexa 2.0 取代)"
arch=('x86_64')
url="https://github.com/Nexa-MC/PCL-N"
license=('Apache-2.0')
depends=('hicolor-icon-theme' 'glibc')
provides=('pcl-n')
conflicts=('pcl-n')
source=("https://github.com/Nexa-MC/PCL-N/releases/download/v1.4.14/PCL_N_Release_linux-x64_NoRuntime_Installer.deb")
sha256sums=('29af6a0907e91ae65793244b669f0666394640967d077f860786547d9aa8f854')
options=('!strip')

package() {
  bsdtar -Oxf "${srcdir}/PCL_N_Release_linux-x64_NoRuntime_Installer.deb" 'data.tar*' \
    | bsdtar -C "${pkgdir}" --use-compress-program='unzstd' -xf -
}