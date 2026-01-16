# Maintainer: Your Name <your@email.com>
pkgname=mycelica-bin
pkgver=0.8.3
pkgrel=1
_tag=0.8.3-1
pkgdesc="Visual knowledge graph for connected thinking (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/Ekats/Mycelica"
license=('AGPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl' 'sqlite' 'zstd')
provides=('mycelica')
conflicts=('mycelica')
source=("mycelica-${pkgver}-linux-x86_64.tar.gz::https://github.com/Ekats/Mycelica/releases/download/v${_tag}/mycelica-${pkgver}-linux-x86_64.tar.gz"
        "mycelica.png::https://raw.githubusercontent.com/Ekats/Mycelica/v${_tag}/src-tauri/icons/128x128.png")
sha256sums=('SKIP'
            'SKIP')

package() {
    install -Dm755 "mycelica" "$pkgdir/usr/bin/mycelica"
    install -Dm755 "mycelica-cli" "$pkgdir/usr/bin/mycelica-cli"
    install -Dm644 "mycelica.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/mycelica.png"

    # Desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/mycelica.desktop" <<EOF
[Desktop Entry]
Name=Mycelica
Comment=Visual knowledge graph for connected thinking
Exec=mycelica
Icon=mycelica
Terminal=false
Type=Application
Categories=Office;Utility;
EOF
}
