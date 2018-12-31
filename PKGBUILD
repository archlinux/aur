# Maintainer: Antoine Damhet <antoine.damhet@lse.epita.fr>
pkgname=mkinitcpio-gnupg
pkgdesc="mkinitcpio hook that adds GnuPG and smartcard support"
pkgver=1.0.1
pkgrel=2
arch=(any)
depends=('gnupg<=2.2.9' pinentry pcsclite)
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

sha256sums=('f4b744aaa890c51817e1fbeb63c3244117ae8b57714872b08a65b1c31a7274c4')
