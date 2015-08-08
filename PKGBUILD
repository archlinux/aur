# Maintainer: Malte Bublitz <malte70+aur[at]mcbx[dot]de>

pkgname=geheim
pkgver=0.2
pkgrel=1
pkgdesc="Simple password manager which tries to follow the Unix principles, written in Bash and using Tar and GnuPG to store passwords."
arch=(any)
url="http://malte-bublitz.de/geheim"
license=("BSD")
depends=("gnupg" "tar")
makedepends=("make")
source=("$pkgname-$pkgver.tar.gz::https://github.com/malte70/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('170336b31607594cd4cf6c56ab757ef6f4919462421040ac264fcce1894ef579')

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
