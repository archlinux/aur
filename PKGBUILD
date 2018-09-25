pkgname=nm-eduroam-ufscar
pkgver=20180925
pkgrel=1
pkgdesc='NetworkManager pre-installed eduroam connection with ufscar.br domain.'
arch=('any')
license=('CC')
url='http://sin.ufscar.br/wifi/conecte-se'
depends=('networkmanager')
source=('eduroam.ufscar.br' 'ufscar_eduroam.pem')
sha256sums=('11473b952b109e6f285ff88022f47b1b974fcb2c19c5d0abc356da83bba8bfa1'
	'2fa432cc6cccee948876d553cd406cc2bdc028c5ad8bec8da501cde2c7aa40b4')
install="nm-reload.install"

package() {
	cd "$srcdir"
	install -Dm644 'ufscar_eduroam.pem' "$pkgdir/usr/local/share/ufscar/eduroam.pem"
	install -Dm600 'eduroam.ufscar.br' "$pkgdir/etc/NetworkManager/system-connections/eduroam.ufscar.br"
	chmod 700 "$pkgdir/etc/NetworkManager/system-connections"
}
