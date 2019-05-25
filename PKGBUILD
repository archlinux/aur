# Maintainer: Maxim Devaev <mdevaev@gmail.com>
# Contributor: Maxim Devaev <mdevaev@gmail.com>


_pkgbase=tc358743

pkgname=tc358743-dkms
pkgver=0.2
pkgrel=1
pkgdesc="DKMS wrapper for TC358743 driver for Arch Linux ARM on RPi"
url="https://kernel.org"
license=(GPL)
arch=(armv6h armv7h)
depends=(wget dkms)
source=(Makefile dkms.conf)
md5sums=(SKIP SKIP)


package() {
	install -Dm644 dkms.conf "$pkgdir/usr/src/$_pkgbase-$pkgver/dkms.conf"
	install -Dm644 Makefile "$pkgdir/usr/src/$_pkgbase-$pkgver/Makefile"

	sed -e "s/@_PKGBASE@/$_pkgbase/" \
		-e "s/@PKGVER@/$pkgver/" \
		-i "$pkgdir/usr/src/$_pkgbase-$pkgver/dkms.conf"
}
