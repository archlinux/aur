# Maintainer: wearr <contact[at]wearr[dot]dev>
pkgname="9launcher-bin"
pkgver="1.2.1"
pkgrel=1
epoch=0
pkgdesc="9Launcher is a FOSS Launcher for Touhou games written in Tauri and Typescript"
arch=("x86_64")
url="https://github.com/wearrrrr/9Launcher"
license=('MIT')
depends=('webkit2gtk' 'gtk3')
provides=('9launcher-bin')
conflicts=('9launcher-bin')
source=("https://github.com/wearrrrr/9Launcher/releases/download/v1.2.1/9launcher" "https://github.com/wearrrrr/9Launcher/releases/download/v1.2.1/assets.tar.gz")
sha256sums=('4d58993cee2a9e6e87a4139bf44d5594fa4a54c6e873f22b754910dfcaf2f060'
            '5389ec3850c1784cb1c237666e72b9d84fdd21957851b0f28ab6ae574950e2dc')

package() {
    mkdir -p "${pkgdir}/assets/"
    tar -xvf assets.tar.gz -C "${pkgdir}/assets/"
    mkdir -p "${pkgdir}/usr/share/9launcher"
    mkdir -p "${pkgdir}/usr/share/applications"
    cp -r ${pkgdir}/assets "${pkgdir}/usr/share/9launcher"
    mkdir -p "${pkgdir}/usr/bin"
    install -m644 "${srcdir}/9launcher" "${pkgdir}/usr/bin/9launcher"
    install -m644 "${pkgdir}/assets/9Launcher.desktop" "${pkgdir}/usr/share/applications/"
    chmod +x "${pkgdir}/usr/bin/9launcher"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
    install -m644 "${pkgdir}/assets/ninelauncher.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ninelauncher.png"
}
