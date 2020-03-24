# Maintainer: Louis Tim Larsen <louis(a)louis.dk>

pkgname=libreoffice-impress-templates
pkgver=2.2
pkgrel=3
pkgdesc="Freely-licensed LibreOffice Impress templates"
arch=(any)
url="https://dohliam.github.io/libreoffice-impress-templates"
license=('MIT')
depends=('libreoffice')
source=("https://github.com/dohliam/"$pkgname"/releases/download/v"$pkgver"/"$pkgname"-all_"$pkgver"-1.deb")
sha512sums=('1395360240649bd6a6cc7e838b542cd2cf7535401a47307dcbde0e7d00f81f4069c1f13e030be4d8ead4655264753960263ab108530c9e0b04fa63faaaae00cf')

package() {
	msg2 "Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	#Fix directory premissions
	find "$pkgdir" -type d -exec chmod 755 '{}' \;
	find "$pkgdir" -type f -exec chmod 644 '{}' \;
	chown root:root -R "$pkgdir"
}
