# Maintainer: Antoine Damhet <antoine.damhet@lse.epita.fr>
pkgname=mkinitcpio-gpg-encrypt
pkgdesc="mkinitcpio hook that adds GnuPG and smartcard support to FDE"
pkgver=0.2
pkgrel=1
arch=(any)
depends=(gnupg pcsclite libusb-compat)
install=${pkgname}.install
url="https://github.com/xdbob/mkinitcpio-gpg-encrypt"
source=(https://github.com/xdbob/$pkgname/archive/v$pkgver.tar.gz)
licence=('GPL')

build() {
	return 0
}

package() {
	cd "$pkgname-$pkgver"

	mkdir -p "${pkgdir}/usr/lib/initcpio/hooks"
	mkdir -p "${pkgdir}/usr/lib/initcpio/install"

	install "gpg-encrypt-hook" "${pkgdir}/usr/lib/initcpio/hooks/gpg-encrypt"
	install "gpg-encrypt-install" "${pkgdir}/usr/lib/initcpio/install/gpg-encrypt"
}

sha256sums=('fac4925f4b501b64826cdcd63c912cb83a09d5d4d531090133e5c4f146a36bb3')
