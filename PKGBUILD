# Maintainer: balaraz <balaraz@tuta.io>

_name=mmv
pkgname="${_name}-origin"
pkgver=2.6
pkgrel=1
pkgdesc="a program to move/copy/link multiple files according to a set of wildcard patterns"
license=(GPLv3)
url="https://github.com/rrthomas/mmv"
arch=(x86_64)
depends=(glibc gc)
makedepends=(gcc make)
provides=(mmv)
conflicts=(mmv mmv-c mmv-c-git mmv-go)
source=("${url}/releases/download/v${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=("SKIP")

package() {
		cd ${_name}-${pkgver}

		./configure && make && make check

		DESTDIR="$pkgdir" make prefix=/usr install

		#install -Dm644 ./COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
