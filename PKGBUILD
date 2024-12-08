# Maintainer: RadiantCorium

pkgname=openlwr-bin
pkgver=alpha20241018
pkgrel=1
arch=('x86_64')
pkgdesc="An open-source multiplayer simulation of a boiling water reactor in development"
url="https://github.com/OpenLWR/OpenLWR"
license=('AGPL-3.0')
source=("https://github.com/OpenLWR/OpenLWR/releases/download/$pkgver/Linux-x64")
sha256sums=("46248c278880126357d2cd78d1bbf3c513f4bb2e15e6c7a36946f67eac1829dd")

package() {
	install -Dm755 "$srcdir/Linux-x64" "$pkgdir/usr/bin/openlwr"

	mkdir -p "$pkgdir/usr/share/applications"
	cat <<EOF > "$pkgdir/usr/share/applications/openlwr.desktop"
[Desktop Entry]
Type=Application
Name=OpenLWR
Exec=/usr/bin/openlwr
Categories=Game
Terminal=false
EOF
}
