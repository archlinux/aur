# Maintainer: Ergus <spacibba@aol.com>
pkgname=kraken_desktop
pkgver=1.0.2
pkgrel=3
pkgdesc="Kraken desktop application"
arch=('aarch64' 'armv7' 'x86_64')
url="https://www.kraken.com/desktop"
license=('custom: commercial')
provides=('kraken_desktop')

source=('kraken.png')

source_x86_64=(https://desktop-downloads.kraken.com/latest/kraken-x86_64-unknown-linux-gnu.zip)
source_armv7=(https://desktop-downloads.kraken.com/latest/kraken-armv7-unknown-linux-gnueabihf.zip)
source_aarch64=(https://desktop-downloads.kraken.com/latest/kraken-aarch64-unknown-linux-gnu.zip)
sha256sums=('6fc49c5128736ffa958ded6d12f3a1fa819bce5b563e768d479ca01a67517148')
sha256sums_aarch64=('1d21e7b9188fd414ca732bd9acbee788b68a45c9f5e9de7bba20c8d3e503e0ff')
sha256sums_armv7=('f94fc5fce9b20224074a039cb69acde6db0ba6354941e496d4882312b573fdfc')
sha256sums_x86_64=('f08d0906dbdb1bd225eb31acb2785d3e5f5d6cc53b0c5f41d126d4e0acc5dcec')


OPTIONS=('!debug' '!lto' '!strip')

package() {

	install -d -m755 "${pkgdir}/usr/bin"
	install -d -m755 "${pkgdir}/usr/share/"{applications,icons}

	install -Dm0755 -t "$pkgdir/usr/bin/" "kraken_desktop"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "kraken.desktop"

	install -Dm0644 -t "$pkgdir/usr/share/icons/" "kraken.png"
}
