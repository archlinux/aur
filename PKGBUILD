# Maintainer: Nikola Tasić <nik at 7aske dot com>
pkgname="rgs-bin"
pkgver="1.14.2"
pkgrel=1
pkgdesc="Batch git repository analysis tool"
arch=('x86_64')
url="https://github.com/7aske/rgs"
conflicts=('rgs')
license=('GPL2')
depends=('libgit2')
makedepends=('cargo')
source=($url/releases/download/$pkgver/rgs-$pkgver-linux-x86_64)

package() {
	install -Dm 755 rgs-${pkgver}-linux-x86_64 -T ${pkgdir}/usr/bin/rgs
	[ ! -e "${pkgdir}/usr/bin/cgs" ] &&
		ln -sf "${pkgdir}/usr/bin/rgs" "${pkgdir}/usr/bin/cgs"
}

sha256sums=('ecb05e2e60d8de0bcbd64797b3032a58d28afac1d08c5a4c058a4a07810048b7')
