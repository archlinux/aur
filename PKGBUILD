#! /bin/bash

pkgname="aur-box"
provides=("${pkgname}")
conflicts=("${pkgname}")

pkgver=19
pkgrel=1
arch=("any")

pkgdesc="Publishes software instantly to Arch Linuxes"
url="https://gitlab.com/es20490446e/${pkgname}"
license=("GPL3")

makedepends=("git")
depends=("silently")
source=("git+${url}.git")
md5sums=("SKIP")


pkgver () {
	cd "${pkgname}"
	git rev-list --count HEAD
}


package () {
	install -Dm755 "${srcdir}/${pkgname}/assets/box/"* -t "${pkgdir}/usr/lib/box"
	install -Dm644 "${srcdir}/${pkgname}/assets/box.1" -t "${pkgdir}/usr/share/man/man1"

	mkdir "${pkgdir}/usr/bin"
	ln --symbolic "/usr/lib/box/_box" "${pkgdir}/usr/bin/box"
}

