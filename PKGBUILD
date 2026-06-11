# Maintainer: Flacier <https://github.com/Fldicoahkiin>
pkgname=steam-cloud-file-manager-bin
pkgver=1.3.5
pkgrel=1
pkgdesc="Steam Cloud File Manager - 管理和查看 Steam 云存档文件的实用工具"
arch=('x86_64')
url="https://github.com/Fldicoahkiin/SteamCloudFileManager"
license=('GPL-3.0-only')
depends=('gtk3' 'webkit2gtk')
optdepends=('steam: Steam client integration')
provides=('steam-cloud-file-manager')
conflicts=('steam-cloud-file-manager')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Fldicoahkiin/SteamCloudFileManager/releases/download/v${pkgver}/SteamCloudFileManager-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('d8ea8317f8495a63e69a97d777440d2e251d7c474b7fff6a27af091a44269933')

package() {
    cd "$srcdir"
    
    # Install binary
    install -Dm755 steam-cloud-file-manager "$pkgdir/usr/bin/steam-cloud-file-manager"
    
    # Install Steam API library if exists
    if [ -f libsteam_api.so ]; then
        install -Dm755 libsteam_api.so "$pkgdir/usr/lib/libsteam_api.so"
    fi
    
    # Install desktop file (will be fetched from repo in CI)
    # install -Dm644 steam-cloud-file-manager.desktop "$pkgdir/usr/share/applications/steam-cloud-file-manager.desktop"
    
    # Install icon (will be fetched from repo in CI)
    # install -Dm644 steam-cloud-file-manager.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/steam-cloud-file-manager.png"
}
