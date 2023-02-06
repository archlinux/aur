# Maintainer: TimeTrap <844177178@qq.com>
pkgname=xmcl-launcher-bin
_pkgname=xmcl-launcher
pkgver=0.34.0
pkgrel=1
pkgdesc="X Minecraft Launcher - 一个现代化的 Minecraft 启动器"
arch=('x86_64')
url="https://xmcl.app/"
license=('MIT')
optdepends=(
    'jre8-openjdk: 启动低版本游戏的最低要求'
    'jre11-openjdk: 推荐使用此版本Java启动1.12(17w13a)-1.17(21w18a)'
    'jre17-openjdk: 推荐使用此Java版本启动1.17(21w19a)及以上的版本'
)
source=(
    "https://github.com/Voxelum/x-minecraft-launcher/releases/download/v${pkgver}/xmcl-${pkgver}-amd64.deb"
    "xmcl.png"
)
sha256sums=('fcc244d946ad29a642801c37eb093d7853c23ad1d66d413ad77b39b48b38152e'
            '7292bbcf951bba1e34d265925c1ca5f786198a3b289a081e134e0e59b743e742')

package(){
    cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
	rm -rf ${pkgdir}/usr/share/icons/hicolor/0x0/
	install -Dm 644 ${srcdir}/xmcl.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/xmcl.png
}
