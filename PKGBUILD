# Maintainer: Twor <i@twor.me>
pkgname=xmcl-launcher
pkgver=0.35.19
pkgrel=1
pkgdesc="X Minecraft Launcher - 一个现代化的 Minecraft 启动器"
arch=('x86_64')
url="https://xmcl.app/"
license=('MIT')
#depends=('')
makedepends=('wget')
optdepends=('jre8-openjdk: 启动低版本游戏的最低要求'
'jre11-openjdk: 推荐使用此版本Java启动1.12(17w13a)-1.17(21w18a)'
'jre17-openjdk: 推荐使用此Java版本启动1.17(21w19a)及以上的版本')
source=("https://github.com/Voxelum/x-minecraft-launcher/releases/download/v$pkgver/xmcl-$pkgver-x64.tar.xz"
    xmcl.desktop
    xmcl.png)
md5sums=('31f824e8c0f8dbc73ae420217086562f'
         '7af75d1e6fb1c031a0ca63a8940f7e9d'
         'a36bd664bd28ee990ade43232e506071')
install="$pkgname.install"

_setvars() {
    cd "$srcdir"
    _full="xmcl-$pkgver-x64"
}

pkgver() {
    _setvars
    printf "$pkgver"
}

build() {
    _setvars
}

package() {
    _setvars
    cd "$srcdir"
    install -Dm644 "$srcdir/xmcl.desktop" "$pkgdir/usr/share/applications/xmcl.desktop"
    mkdir -p "$pkgdir/usr/share/icons/hicolor/192x192/apps/"
    install -Dm644 "$srcdir/xmcl.png" "$pkgdir/usr/share/icons/hicolor/192x192/apps/xmcl.png"
    mkdir -p "$pkgdir/usr/share/xmcl/"
    cp -r $_full "$pkgdir/usr/share/xmcl/$_full"
    chmod -R +x "$pkgdir/usr/share/xmcl/$_full"
}