# Maintainer: sssemil <sssemil at github dot com>
# Contributor: Ergus <spacibba at aol dot com>
pkgname=kraken-desktop-auto-bin
pkgver=1.30.0
pkgrel=1
pkgdesc="Kraken crypto exchange desktop application"
arch=('aarch64' 'armv7' 'x86_64')
url="https://www.kraken.com/desktop"
license=('custom: commercial')
provides=('kraken_desktop')
conflicts=('kraken_desktop')

source=('kraken.png')

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://desktop-downloads.kraken.com/latest/kraken-x86_64-unknown-linux-gnu.zip")
source_armv7=("${pkgname}-${pkgver}-armv7.zip::https://desktop-downloads.kraken.com/latest/kraken-armv7-unknown-linux-gnueabihf.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://desktop-downloads.kraken.com/latest/kraken-aarch64-unknown-linux-gnu.zip")
sha256sums=('6fc49c5128736ffa958ded6d12f3a1fa819bce5b563e768d479ca01a67517148')
sha256sums_aarch64=('9b3b091ea2ade36a1444d7d73c80074ef9bfe1d9646b9573823c95957f0fe93e')
sha256sums_armv7=('0cff337f8d7c971bffc0e9115059c5c705ca98e3449ce81ba5958b42eb150d1a')
sha256sums_x86_64=('a5821e299d6558f5cca0db58b29f3914f4d79ae8cb8f996ea829c69fa31c31ad')


options=('!debug' '!lto' '!strip')

package() {

	install -d -m755 "${pkgdir}/usr/bin"
	install -d -m755 "${pkgdir}/usr/share/"{applications,icons}

	install -Dm0755 -t "$pkgdir/usr/bin/" "kraken_desktop"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "kraken.desktop"

	install -Dm0644 -t "$pkgdir/usr/share/icons/" "kraken.png"
}
