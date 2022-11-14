# Maintainer: BasedUser <route@baseduser.eu.org>
# Contributor: Egor Vorontsov <sdoregor@sdore.me>

pkgname=orbitfight
pkgver=0.8.1
pkgrel=1
pkgdesc="A game in C++ written with SFML, very in-development"
arch=('x86_64')
url="https://github.com/Ilya246/${pkgname}"
license=('GPL3')
depends=('ttf-hack')
makedepends=('sfml' 'gendesk')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/${pkgname}"

	gendesk --pkgname "${pkgname}" --pkgdesc "${pkgdesc}"
}

build() {
	cd "${srcdir}/${pkgname}"

	make
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 'SERVERS.md' -t "${pkgdir}/usr/share/${pkgname}/"

	install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
}
