# Maintainer: Chizuru-Kagurazaka <chizuru-mtf@outlook.com>
# Maintainer: bilibili_xiaok <the_xiaok@qq.com>
# Contributor: Twor <i@twor.me>
# Contributor: Chizuru-Kagurazaka <chizuru-mtf@outlook.com>
# Contributor: bilibili_xiaok <the_xiaok@qq.com>
pkgname=xmcl-launcher
pkgver=0.43.3
pkgrel=1
pkgdesc="X Minecraft Launcher - 一个现代化的 Minecraft 启动器"
arch=('x86_64')
provide=("xmcl")
url="https://xmcl.app/"
license=('MIT')
depends=('electron27')
#makedepends=('wget')
conflicts=('xmcl-launcher-bin')
optdepends=('jre8-openjdk: 启动低版本游戏的最低要求'
'jre11-openjdk: 推荐使用此版本Java启动1.12(17w13a)-1.17(21w18a)'
'jre17-openjdk: 推荐使用此Java版本启动1.17(21w19a)及以上的版本')
source=("https://github.com/Voxelum/x-minecraft-launcher/releases/download/v$pkgver/app-$pkgver-linux.asar"
    xmcl.desktop
    xmcl.png
    xmcl-launcher)
md5sums=('4b10995e1f191db4158f780a77d7fa6a'
         'ef302df83d9a2e867dc94e509ba1e0b2'
         '8facdbaf84f32aaefff5d6fcdad0b8a8'
         '0ca353b6f4df117ce040b717f15eada2')
#install="$pkgname.install"

package() {
    cd "$srcdir"
    install -Dm644 "$srcdir/xmcl.desktop" "$pkgdir/usr/share/applications/xmcl.desktop"
    install -Dm644 "$srcdir/xmcl.png" "$pkgdir/usr/share/icons/hicolor/192x192/apps/xmcl.png"
    install -Dm644 "${srcdir}/app-$pkgver-linux.asar" "${pkgdir}"/usr/share/xmcl/xmcl.asar
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
