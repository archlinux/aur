# Maintainer: Ashe Sterling <ashe.sterling@outlook.com>
pkgname=kiwi-soundboard
pkgver=0.0.1
pkgrel=1
pkgdesc="An oddly specific soundboard daemon and control application."
arch=('x86_64')
url="https://gitlab.com/ashe.sterling/${pkgname}"
license=('WTFPL-2-or-later')
depends=()
makedepends=('glibc' 'gcc')
source=("${pkgname}-v${pkgver}.tar.gz::https://gitlab.com/ashe.sterling/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('36b2bee478c2218a073c54e6acbdc98c0da9ad98aeb7732ff716485713d74332')

build() {
	cd "$srcdir/${pkgname}-v${pkgver}"
	make
}

package() {
	cd "$srcdir/${pkgname}-v${pkgver}"
	install -Dm755 soundboardd "${pkgdir}/usr/bin/soundboardd"
	install -Dm755 sbctl "${pkgdir}/usr/bin/sbctl"
	install -Dm644 soundboard.service "${pkgdir}/usr/lib/systemd/user/soundboard.service"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
