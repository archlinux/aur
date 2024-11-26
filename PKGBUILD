# Maintainer: Ergus <spacibba@aol.com>
pkgname=kraken_desktop
pkgver=1.1.1
pkgrel=2
pkgdesc="Kraken crypto exchange desktop application"
arch=('aarch64' 'armv7' 'x86_64')
url="https://www.kraken.com/desktop"
license=('custom: commercial')
provides=('kraken_desktop')

source=('kraken.png')

source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://desktop-downloads.kraken.com/latest/kraken-x86_64-unknown-linux-gnu.zip")
source_armv7=("${pkgname}-${pkgver}.tar.gz::https://desktop-downloads.kraken.com/latest/kraken-armv7-unknown-linux-gnueabihf.zip")
source_aarch64=("${pkgname}-${pkgver}.tar.gz::https://desktop-downloads.kraken.com/latest/kraken-aarch64-unknown-linux-gnu.zip")
sha256sums=('6fc49c5128736ffa958ded6d12f3a1fa819bce5b563e768d479ca01a67517148')
sha256sums_aarch64=('77245ee3da775254da20e5855962e8aa74a360980133f59017740f88afbf8524')
sha256sums_armv7=('77245ee3da775254da20e5855962e8aa74a360980133f59017740f88afbf8524')
sha256sums_x86_64=('77245ee3da775254da20e5855962e8aa74a360980133f59017740f88afbf8524')


OPTIONS=('!debug' '!lto' '!strip')

package() {

	install -d -m755 "${pkgdir}/usr/bin"
	install -d -m755 "${pkgdir}/usr/share/"{applications,icons}

	install -Dm0755 -t "$pkgdir/usr/bin/" "kraken_desktop"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "kraken.desktop"

	install -Dm0644 -t "$pkgdir/usr/share/icons/" "kraken.png"
}
