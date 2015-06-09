# Maintainer: Miika-Petteri Matikainen <miikapetteri@gmail.com>
pkgname=pidgin-remember-read-status
pkgver=0.1.2
pkgrel=1
pkgdesc="Pidgin plugin to remember which chats are unread when connecting to a chat room"
url="https://github.com/nablaa/pidgin-remember-read-status"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('pidgin' 'libpurple')
optdepends=()
makedepends=('cmake' 'git')
conflicts=()
replaces=()
backup=()

build() {
	cd "${srcdir}"
	git clone git://github.com/nablaa/pidgin-remember-read-status.git ${pkgname}
	cd ${pkgname}
	git checkout "v${pkgver}"

	mkdir build
	cd build
	cmake ..
	make
}

package() {
	cd "${srcdir}/${pkgname}"

	mkdir -p "${pkgdir}/usr/lib/pidgin"
	cp build/src/libremember_read_status.so "${pkgdir}/usr/lib/pidgin"
}
