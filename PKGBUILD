# Maintainer: Louis Tim Larsen <louis(a)louis.dk>

pkgname=libreoffice-impress-templates
pkgver=2.2
pkgrel=4
pkgdesc="Freely-licensed LibreOffice Impress templates"
arch=(any)
url="https://dohliam.github.io/libreoffice-impress-templates"
license=('MIT')
depends=('libreoffice')
source=("https://github.com/dohliam/"$pkgname"/releases/download/v"$pkgver"/"$pkgname"-all_"$pkgver"-1.deb"
	'skip-default-templates.txt')
sha512sums=('1395360240649bd6a6cc7e838b542cd2cf7535401a47307dcbde0e7d00f81f4069c1f13e030be4d8ead4655264753960263ab108530c9e0b04fa63faaaae00cf'
            '89bd79de4e7b88df40fb7673b27d4ec54a2c73f1c70fd9d5ade22dffcb0c2980ebed724a2ca095fa9d7cb4c024c2ddd943c5c2fad34a3b878f75d37e59496427')

package() {
	echo "Extracting the data.tar.xz..."
	bsdtar -X skip-default-templates.txt -xf data.tar.xz -C "$pkgdir/"
	#Fix directory premissions
	find "$pkgdir" -type d -exec chmod 755 '{}' \;
	find "$pkgdir" -type f -exec chmod 644 '{}' \;
	chown root:root -R "$pkgdir"
}
