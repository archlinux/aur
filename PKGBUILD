# Maintainer: wearr <contact[at]wearr[dot]dev>
pkgname="9launcher-bin"
pkgver="1.1.1"
pkgrel=1
epoch=0
pkgdesc="9Launcher is a FOSS Launcher for Touhou games written in Tauri and Typescript"
arch=("x86_64")
url="https://github.com/wearrrrr/9Launcher"
license=('MIT')
depends=('webkit2gtk' 'gtk3')
provides=('9launcher-bin')
conflicts=('9launcher-bin')
source=("https://github.com/wearrrrr/9Launcher/releases/download/v1.1.1/9launcher" "https://github.com/wearrrrr/9Launcher/releases/download/v1.1.1/assets-v1.1.1.tar.gz")
sha256sums=('567413e9492d4bd18d106c3e7ada627dab609afb72681001735032c9b887def0'
            '1d06bf5ea511546f328d39d3e476fa3c59d85a6c36ea267bb6321873b639d7b1')

package() {
    tar -xvf assets-v1.1.1.tar.gz
    sudo mkdir -p /usr/share/9launcher
    sudo cp -r assets-v1.1.1 /usr/share/9launcher
    sudo install -Dm755 "9launcher" /usr/bin/9launcher
    sudo desktop-file-install /usr/share/9launcher/assets-v1.1.1/9Launcher.desktop
    chmod +x /usr/bin/9launcher
}
