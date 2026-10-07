# Maintainer: SHORiN-KiWATA <fcl709@outlook.com>

pkgname=wegame-launcher
pkgver=0.1.2
pkgrel=1
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
sha256sums=('90ea092e707170f7e924c71deec13a7df865bf96d44e63680b21df05fd90ecff')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 wegame-launcher -t "$pkgdir/usr/bin"
    install -Dm644 wegame-launcher.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 wegame.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/wegame.png"
}
