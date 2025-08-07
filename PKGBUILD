# Maintainer: Ergus <spacibba@aol.com>
pkgname=kraken_desktop
pkgver=1.7.1
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
sha256sums_aarch64=('0e8291cfeafedf96cbdab8d753b305b7a2b4eb08edd545c1e6bd45eaca13d283')
sha256sums_armv7=('78676ad30e1851486de82e83792d1734579542cbe79e632d4743c29c4c83cf74')
sha256sums_x86_64=('2ce7f10185efb31f3121107b69e2ec9dcb8cbbc5a215ffc71dac3783e9ca9a1c')


OPTIONS=('!debug' '!lto' '!strip')

package() {

	install -d -m755 "${pkgdir}/usr/bin"
	install -d -m755 "${pkgdir}/usr/share/"{applications,icons}

	install -Dm0755 -t "$pkgdir/usr/bin/" "kraken_desktop"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "kraken.desktop"

	install -Dm0644 -t "$pkgdir/usr/share/icons/" "kraken.png"
}
