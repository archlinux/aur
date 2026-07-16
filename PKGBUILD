# Maintainer: sssemil <sssemil at github dot com>
# Contributor: Ergus <spacibba at aol dot com>
pkgname=kraken-desktop-auto-bin
pkgver=1.22.0
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
sha256sums_aarch64=('751b899b25c316ffffa18aee6d8fade2ce51bdd85ca89373936f4dc467baae3e')
sha256sums_armv7=('bb204e120a16904aaf78f5c176ddee70381ed741f8b4ecb932e953c054f350cc')
sha256sums_x86_64=('80e45415a3fcd51cd9057b85a7f953a8e2b28c568d65a513ee3c16003be9e9f7')


options=('!debug' '!lto' '!strip')

package() {

	install -d -m755 "${pkgdir}/usr/bin"
	install -d -m755 "${pkgdir}/usr/share/"{applications,icons}

	install -Dm0755 -t "$pkgdir/usr/bin/" "kraken_desktop"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "kraken.desktop"

	install -Dm0644 -t "$pkgdir/usr/share/icons/" "kraken.png"
}
