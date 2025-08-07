# Maintainer: Cypher-Monarch <monarchcypher@gmail.com>
pkgname=cyphergate-vpn-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Cross-platform VPN GUI for OpenVPN - Binary release"
arch=('x86_64')
url="https://github.com/Cypher-Monarch/CypherGate"
license=('custom')
depends=('openvpn' 'unzip')
provides=('cyphergate-vpn')
conflicts=('cyphergate-vpn')
source=("https://github.com/Cypher-Monarch/CypherGate/releases/download/v$pkgver/CypherGate-Linux-v${pkgver}.zip")
sha256sums=('SKIP')

package() {
  install -d "$pkgdir/opt/CypherGate"
  install -Dm755 "$srcdir/CypherGate-Linux/cyphergate.elf" "$pkgdir/opt/CypherGate/cyphergate.elf"
  cp -r "$srcdir/CypherGate-Linux/Assets" "$pkgdir/opt/CypherGate/"

  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/CypherGate.desktop" <<EOF
[Desktop Entry]
Name=CypherGate VPN
Exec=/opt/CypherGate/cyphergate.elf
Icon=/opt/CypherGate/Assets/logo.png
Type=Application
Categories=Network;Utility;
EOF
}

