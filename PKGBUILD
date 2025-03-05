# Maintainer:       baiyuanneko <i at nekomoe dot xyz>
pkgname=bangumium-bin
pkgver=0.9.3
pkgrel=1
pkgdesc="Universal third-party desktop client for bgm.tv"
arch=('any')
url="https://github.com/Bangumium/Bangumium"
license=('MIT')
depends=('python-gobject' 'webkit2gtk-4.1')
provides=('bangumium')
conflicts=('bangumium-git')
source=(
    'icon.png'::"https://raw.githubusercontent.com/Bangumium/Bangumium/refs/tags/v${pkgver}/icon.png"
    "bangumium-linux"::"${url}/releases/download/v${pkgver}/bangumium-linux"
)
sha256sums=('454f0bef7bbc8d81f361d97e3f0fb23d9f4ccbc5a824d8c3419479e4dc5a9341'
            'd150cca1de77164584876ee1c41c8cd48625c4838ddcf283e1d51c0aa9b413c0')

package() {
    cd "$srcdir"
    install -Dm644 "icon.png"           "${pkgdir}/usr/share/icons/bangumium.png"
    install -Dm755 "bangumium-linux"    "${pkgdir}/usr/bin/bangumium"
    install -Dm644 "/dev/stdin"         "${pkgdir}/usr/share/applications/bangumium.desktop" << "EOF"
[Desktop Entry]
Name=Bangumium
Comment=Universal third-party desktop client for bgm.tv
Exec=/usr/bin/bangumium
Terminal=false
Icon=/usr/share/icons/bangumium.png
Type=Application
StartupNotify=false
Categories=Network
EOF
}