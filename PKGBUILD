# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=netlabel-tools
pkgver=0.30.0
pkgrel=1
pkgdesc="Tools to manage the Linux NetLabel subsystem"
arch=(x86_64)
url="https://github.com/netlabel/netlabel_tools"
license=(GPL-2.0-only)
depends=(bash glibc libnl)
source=("https://github.com/netlabel/${pkgname/-/_}/releases/download/v$pkgver/${pkgname/-/_}-$pkgver.tar.gz")
sha256sums=('6192e9715b45b34136f90e7505d4416028e32aa296e12f72f9d7245bcb9e1d59')

build() {
	cd "${pkgname/-/_}-$pkgver"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--sbindir=/usr/bin
	make
}

package() {
	cd "${pkgname/-/_}-$pkgver"
	make DESTDIR="$pkgdir/" install
}
