pkgname=nm-eduroam-ufscar
pkgver=20190409
pkgrel=1
pkgdesc='NetworkManager pre-installed eduroam connection with ufscar.br domain.'
arch=('any')
license=('CC')
url='http://sin.ufscar.br/wifi/conecte-se'
depends=('networkmanager')
source=('eduroam.ufscar.br' 'ufscar_eduroam.pem')
sha256sums=('17963bfdbb5894eb9a30e86a4c801be4a4596eb67f6e916dffdc570311d96d9c'
	'2fa432cc6cccee948876d553cd406cc2bdc028c5ad8bec8da501cde2c7aa40b4')
install="nm-reload.install"

package() {
	cd "$srcdir"
	install -Dm644 'ufscar_eduroam.pem' "$pkgdir/usr/local/share/ufscar/eduroam.pem"
	install -Dm600 'eduroam.ufscar.br.nmconnection' "$pkgdir/etc/NetworkManager/system-connections/eduroam.ufscar.br"
	chmod 700 "$pkgdir/etc/NetworkManager/system-connections"
}
