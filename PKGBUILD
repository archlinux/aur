# Maintainer: Axolotl <axolotl@ghs.red>
pkgname=axolotl-launcher-bin
pkgver=1.3.3
pkgrel=1
pkgdesc="Axolotl Launcher - Minecraft mod launcher"
arch=('x86_64' 'aarch64')
url="https://github.com/Mystic-Stars/Axolotl"
license=('MIT')
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
provides=('axolotl-launcher')
conflicts=('axolotl-launcher')
source_x86_64=("Axolotl.Launcher_${pkgver}_amd64.AppImage.tar.gz::https://github.com/Mystic-Stars/Axolotl/releases/download/v${pkgver}/Axolotl.Launcher_${pkgver}_amd64.AppImage.tar.gz")
source_aarch64=("Axolotl.Launcher_${pkgver}_aarch64.AppImage.tar.gz::https://github.com/Mystic-Stars/Axolotl/releases/download/v${pkgver}/Axolotl.Launcher_${pkgver}_aarch64.AppImage.tar.gz")
sha256sums_x86_64=('c1ad41e8aafdb1b6b88e9ed7ad4636324e85fbd263a5e857481d99e89a78783d')
sha256sums_aarch64=('1a6259bbe58600e4ec02fc06bc599bccda6fc0da43e478e0ddc7d319f7a878bb')

package() {
    cd "$srcdir"
    
    # Install AppImage
    install -Dm755 "Axolotl.Launcher-${pkgver}.AppImage" "$pkgdir/usr/bin/axolotl-launcher"
    
    # Install desktop file
    install -Dm644 "axolotl.desktop" "$pkgdir/usr/share/applications/axolotl.desktop"
    
    # Install icons
    for size in 32 64 128 256 512; do
        if [ -f "usr/share/icons/hicolor/${size}x${size}/apps/axolotl.png" ]; then
            install -Dm644 "usr/share/icons/hicolor/${size}x${size}/apps/axolotl.png" \
                "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/axolotl.png"
        fi
    done
}
