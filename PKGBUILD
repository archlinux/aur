# Maintainer: Chizuru-Kagurazaka <chizuru-mtf@outlook.com>
# Maintainer: bilibili_xiaok <the_xiaok@qq.com>
# Contributor: Twor <i@twor.me>
# Contributor: Chizuru-Kagurazaka <chizuru-mtf@outlook.com>
# Contributor: bilibili_xiaok <the_xiaok@qq.com>
# Contributor: Vova-K <v1mkss.m@gmail.com>
pkgname=xmcl-launcher
pkgver=0.46.0
pkgrel=1
pkgdesc="X Minecraft Launcher - A modern Minecraft launcher"
arch=('x86_64' 'aarch64')
provide=("xmcl")
url="https://xmcl.vercel.app/"
license=('MIT')
conflicts=('xmcl-launcher-bin')
optdepends=('jre8-openjdk: Minimum requirement for launching older game versions'
'jre11-openjdk: Recommended Java version for launching versions 1.12-1.17'
'jre17-openjdk: Recommended Java version for launching version 1.17 and above'
'jre22-openjdk: Recommended Java version for launching version 1.20.5+ and above')

source_x86_64=(
    "https://github.com/Voxelum/x-minecraft-launcher/releases/download/v${pkgver}/xmcl-${pkgver}-amd64.deb"
    "xmcl.png"
)

source_aarch64=(
    "https://github.com/Voxelum/x-minecraft-launcher/releases/download/v${pkgver}/xmcl-${pkgver}-arm64.deb"
    "xmcl.png"
)

sha256sums_x86_64=(
    "ce0eb533f258dd9c01813ca64bf048f9d1a06175fe5fb49326a547fa77ecaad0"
    "4c56e72cc6784c4c2d870c307d74e7afa6c13b001bb52f9b255cd82ab709adcb"
)
sha256sums_aarch64=(
    "5c9471e64980df1165bb0fa3e8934e99ebe5e1e2c073088d6b95ec70de23a1bc"
    "4c56e72cc6784c4c2d870c307d74e7afa6c13b001bb52f9b255cd82ab709adcb"
)

package(){
  tar -xvf 'data.tar.xz' -C "${pkgdir}"
  install -dv "${pkgdir}/usr/bin"
  install -Dm 644 ${srcdir}/xmcl.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/xmcl.png
}
