# Maintainer: Ergus <spacibba@aol.com>
pkgname=kraken_desktop
pkgver=1.4.0
pkgrel=1
pkgdesc="Kraken crypto exchange desktop application"
arch=('aarch64' 'armv7' 'x86_64')
url="https://www.kraken.com/desktop"
license=('custom: commercial')
provides=('kraken_desktop')

source=('kraken.png')

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://desktop-downloads.kraken.com/latest/kraken-x86_64-unknown-linux-gnu.zip")
source_armv7=("${pkgname}-${pkgver}-armv7.zip::https://desktop-downloads.kraken.com/latest/kraken-armv7-unknown-linux-gnueabihf.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://desktop-downloads.kraken.com/latest/kraken-aarch64-unknown-linux-gnu.zip")
sha256sums=('6fc49c5128736ffa958ded6d12f3a1fa819bce5b563e768d479ca01a67517148')
sha256sums_aarch64=('043e4783c5e3cda4e32b1aed53fc115280eb1cb182f8443ff3f098d5e565ca77')
sha256sums_armv7=('246334ea44a0ee761d50b065a9c3ca1ded29bc0bfb0865f94da194fef1de9947')
sha256sums_x86_64=('12587689ecffe3b7dea0cb054d99579a427636c03d5097dad3f30860223b3cb7')


OPTIONS=('!debug' '!lto' '!strip')

package() {

	install -d -m755 "${pkgdir}/usr/bin"
	install -d -m755 "${pkgdir}/usr/share/"{applications,icons}

	install -Dm0755 -t "$pkgdir/usr/bin/" "kraken_desktop"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "kraken.desktop"

	install -Dm0644 -t "$pkgdir/usr/share/icons/" "kraken.png"
}
