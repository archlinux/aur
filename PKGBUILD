# Maintainer: Chizuru-Kagurazaka <chizuru-mtf@outlook.com>
# Maintainer: bilibili_xiaok <the_xiaok@qq.com>
# Contributor: Twor <i@twor.me>
# Contributor: Chizuru-Kagurazaka <chizuru-mtf@outlook.com>
# Contributor: bilibili_xiaok <the_xiaok@qq.com>
pkgname=xmcl-launcher
pkgver=0.43.0
pkgrel=2
pkgdesc="X Minecraft Launcher - 一个现代化的 Minecraft 启动器"
arch=('x86_64')
provide=("xmcl")
url="https://xmcl.app/"
license=('MIT')
depends=('electron21-bin')
#makedepends=('wget')
conflicts=('xmcl-launcher-bin')
optdepends=('jre8-openjdk: 启动低版本游戏的最低要求'
'jre11-openjdk: 推荐使用此版本Java启动1.12(17w13a)-1.17(21w18a)'
'jre17-openjdk: 推荐使用此Java版本启动1.17(21w19a)及以上的版本')
source=("https://github.com/Voxelum/x-minecraft-launcher/releases/download/v$pkgver/app-$pkgver-linux.asar"
    xmcl.desktop
    xmcl.png
    xmcl-launcher)
md5sums=('e7be5f99e708392521eb54aa90525d0b'
         'ef302df83d9a2e867dc94e509ba1e0b2'
         '8facdbaf84f32aaefff5d6fcdad0b8a8'
         'b58bd18c2830e2915211af9e8564dc3a')
#install="$pkgname.install"

package() {
    cd "$srcdir"
    install -Dm644 "$srcdir/xmcl.desktop" "$pkgdir/usr/share/applications/xmcl.desktop"
    install -Dm644 "$srcdir/xmcl.png" "$pkgdir/usr/share/icons/hicolor/192x192/apps/xmcl.png"
    install -Dm644 "${srcdir}/app-$pkgver-linux.asar" "${pkgdir}"/usr/share/xmcl/xmcl.asar
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
