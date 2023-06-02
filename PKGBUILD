# Maintainer: wearr <contact[at]wearr[dot]dev>
pkgname="9launcher-bin"
pkgver="1.2.0"
pkgrel=1
epoch=0
pkgdesc="9Launcher is a FOSS Launcher for Touhou games written in Tauri and Typescript"
arch=("x86_64")
url="https://github.com/wearrrrr/9Launcher"
license=('MIT')
depends=('webkit2gtk' 'gtk3')
provides=('9launcher-bin')
conflicts=('9launcher-bin')
source=("https://github.com/wearrrrr/9Launcher/releases/download/v1.2.0/9launcher" "https://github.com/wearrrrr/9Launcher/releases/download/v1.1.1/assets-v1.1.1.tar.gz")
sha256sums=('2014bffad116b3c7d6439fb62403af1e635b19131300a8828900ab69edf7672a'
            '1d06bf5ea511546f328d39d3e476fa3c59d85a6c36ea267bb6321873b639d7b1')

package() {
    mkdir -p "${pkgdir}/assets/"
    tar -xvf assets-v1.1.1.tar.gz -C "${pkgdir}/assets/" --strip-components 1
    mkdir -p "${pkgdir}/usr/share/9launcher"
    mkdir -p "${pkgdir}/usr/share/applications"
    cp -r assets-v1.1.1 "${pkgdir}/usr/share/9launcher"
    mkdir -p "${pkgdir}/usr/bin"
    install -m644 "${srcdir}/9launcher" "${pkgdir}/usr/bin/9launcher"
    install -m644 "${pkgdir}/assets/9Launcher.desktop" "${pkgdir}/usr/share/applications/"
    chmod +x "${pkgdir}/usr/bin/9launcher"
}
