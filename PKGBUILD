pkgname=nm-eduroam-ufscar
pkgver=20260825
pkgrel=1
pkgdesc='NetworkManager pre-installed eduroam connection with ufscar.br domain.'
arch=('any')
license=('CC')
url='http://sin.ufscar.br/wifi/conecte-se'
depends=('networkmanager')
source=('eduroam.ufscar.br' 'ufscar_eduroam.pem')
sha256sums=('11473b952b109e6f285ff88022f47b1b974fcb2c19c5d0abc356da83bba8bfa1'
	'4fa3126d8d3a11d1c4855a4f807cbad6cf919d3a5a88b03bea2c6372d93c40c9')
install="nm-reload.install"

package() {
	cd "$srcdir"
	install -Dm644 'ufscar_eduroam.pem' "$pkgdir/usr/local/share/ufscar/eduroam.pem"
	install -Dm600 'eduroam.ufscar.br' "$pkgdir/etc/NetworkManager/system-connections/eduroam.ufscar.br.nmconnection"
	chmod 700 "$pkgdir/etc/NetworkManager/system-connections"
}
