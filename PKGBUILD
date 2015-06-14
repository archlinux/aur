# Maintainer: Malte Bublitz <malte70+aur[at]mcbx[dot]de>

pkgname=geheim
pkgver=0.1.1
pkgrel=2
pkgdesc="Simple password manager which tries to follow the Unix principles, written in Bash and using Tar and GnuPG to store passwords."
arch=(any)
url="http://malte-bublitz.de/geheim"
license=("BSD")
depends=("gnupg" "tar")
makedepends=("make")
source=("$pkgname-$pkgver.tar.gz::https://github.com/malte70/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('e3153bcd7ccbeb7ed37446073f6a61c3ecc2afd7ddbb4950a6b45ee441a5dbcc')

check() {
	cd "${srcdir}/$pkgname-${pkgver}"
	make -B test
}

build() {
	true
}

package() {
	cd "${srcdir}/$pkgname-${pkgver}"
	make DEST=${pkgdir}/usr install
}
# vim:set ts=2 sw=2 noet:
