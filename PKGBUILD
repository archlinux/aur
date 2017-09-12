# Maintainer: David Población Criado <davidpblcrd@protonmail.com>
pkgname=aemet-cli
pkgver=1.0
pkgrel=1
pkgdesc="Aplicación de terminal que permite obtener las previsiones del tiempo meteorológico en España. Usa datos abiertos de la Agencia Estatal de Meteorología (AEMET) del Gobierno de España."
arch=('any')
url="https://davidpob99.github.io/aemet-cli/"
license=('Apache')
depends=('jq' 'curl' 'libxml2')
source=("https://github.com/davidpob99/aemet-cli/archive/v$pkgver.tar.gz")
md5sums=('433d4d538437819317f38a1cd8748905')

package() {
	cd "$pkgbase-$pkgver"		
	install -Dm755 aemet-cli /$pkgdir/usr/bin/aemet-cli
	install -Dm755 aemet.json /$pkgdir/var/lib/aemet-cli/aemet.json
	gzip aemet-cli.1
	install -Dm755 aemet-cli.1.gz /$pkgdir/usr/share/man/man1/aemet-cli.1.gz
	install -Dm755 LICENSE /$pkgdir/usr/share/licenses/aemet-cli/LICENSE
}
