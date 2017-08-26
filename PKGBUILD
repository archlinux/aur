# Maintainer: Antoine Damhet <antoine.damhet@lse.epita.fr>
pkgname=mkinitcpio-gnupg
pkgdesc="mkinitcpio hook that adds GnuPG and smartcard support"
pkgver=1.0
pkgrel=1
arch=(any)
depends=(gnupg pinentry pcsclite)
optdepends=('libusb-compat: Allows the use of USB smartcard like YubiKey')
url="https://github.com/xdbob/mkinitcpio-gnupg"
source=(https://github.com/xdbob/$pkgname/archive/v$pkgver.tar.gz)
licence=('GPL')

build() {
	return 0
}

package() {
	cd "$pkgname-$pkgver"

	install -D -m0644 "gnupg-hook" "${pkgdir}/usr/lib/initcpio/hooks/gnupg"
	install -D -m0644 "gnupg-install" "${pkgdir}/usr/lib/initcpio/install/gnupg"
}

sha256sums=('7e65320dfc84caf2e3ae30ad5fcee0b2cd50faaf62bb5d5818a269186919c9b0')
