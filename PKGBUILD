# Maintainer: SHORiN-KiWATA <fcl709@outlook.com>

pkgname=wegame-launcher
pkgver=0.1.0
pkgrel=2
pkgdesc='开箱即用的简易 WeGame 启动器，使用 Proton 运行'
arch=('any')
url='https://github.com/SHORiN-KiWATA/wegame-launcher'
license=('GPL-3.0-only')
depends=('python' 'python-gobject' 'gtk4')
optdepends=(
    'gamescope: run WeGame nested in its own compositor'
    'mangohud: performance overlay'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9b8052e30ba279254551987ab3e5ebcd1d21e4c3627647c03bf1bf179c1fe40c')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 wegame-launcher -t "$pkgdir/usr/bin"
    install -Dm644 wegame-launcher.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 wegame.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/wegame.png"
}
