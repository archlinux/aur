# Maintainer: Aptivi <ceo at aptivi dot anonaddy dot com>
pkgname=bskyid-git
pkgver=v1.0.1.r0.899856d
pkgrel=1
pkgdesc="Unofficial application to fetch your BlueSky ID"
arch=(any)
url="https://aptivi.github.io"
license=('GPL-3.0-or-later')
depends=('bash')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("${pkgname}::git+https://github.com/Aptivi/BskyId#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "${pkgname}"
	make install DESTDIR=$pkgdir
}
