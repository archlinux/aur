# Maintainer: Ashe Sterling <ashe.sterling@outlook.com>
pkgname=kiwi-soundboard
pkgver=0.0.2
pkgrel=1
pkgdesc="An oddly specific soundboard daemon and control application."
arch=('x86_64')
url="https://gitlab.com/ashe.sterling/${pkgname}"
license=('WTFPL-2-or-later')
depends=()
makedepends=('glibc' 'gcc')
source=("${pkgname}-v${pkgver}.tar.gz::https://gitlab.com/ashe.sterling/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('ebd4f51ecc2ee22d75b2c14ff28f3a9554916f673a488a940e8c5f9d182940d5')

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
