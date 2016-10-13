# Maintainer: Antoine Damhet <antoine.damhet@lse.epita.fr>
pkgname=mkinitcpio-gpg-encrypt
pkgdesc="mkinitcpio hook that adds GnuPG and smartcard support to FDE"
pkgver=0.1
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

sha256sums=('a307a5f7c8d37ead81f0d788f66720b5187ef18c67a69c32d0ca98ef124e89ef')
