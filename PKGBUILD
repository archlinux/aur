# Maintainer: Flacier <https://github.com/Fldicoahkiin>
pkgname=steam-cloud-file-manager-bin
pkgver=1.2.2
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
sha256sums=('2ae8ba47162d66b01a5249b506bb229f88137bba7fa2058bb69d6882150a27c1')

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
