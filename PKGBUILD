# Maintainer: Your Name <your@email.com>
pkgname=mycelica-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Visual knowledge graph for connected thinking (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/Ekats/Mycelica"
license=('AGPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl')
provides=('mycelica')
conflicts=('mycelica')
source=("mycelica-$pkgver.tar.gz::https://github.com/Ekats/Mycelica/releases/download/v0.8.0-1/mycelica-0.8.0-linux-x86_64.tar.gz"
        "mycelica-cli-$pkgver.tar.gz::https://github.com/Ekats/Mycelica/releases/download/v0.8.0-1/mycelica-cli-0.8.0-linux-x86_64.tar.gz")
sha256sums=('ab926874ea82dea8281ded085b61f973b779f5562d68368ff8a69bc8c554df26'
            'c793516d9360c34050e72fc456a53ce817de0f4feb67d3185df063f551654e27')

package() {
    install -Dm755 "mycelica" "$pkgdir/usr/bin/mycelica"
    install -Dm755 "mycelica-cli" "$pkgdir/usr/bin/mycelica-cli"

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
