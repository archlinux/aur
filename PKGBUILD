#! /bin/bash

Name="silently"
pkgname="${Name}-git"
provides=("${Name}")
conflicts=("${Name}")

pkgver=11
pkgrel=1
arch=("any")

pkgdesc="Silences a command output except on error, so its correct operation is self supervised (aka jidoka)"
url="https://gitlab.com/es20490446e/${Name}"
license=("GPL3")

makedepends=("git")
depends=("bash")
source=("git+${url}.git")
md5sums=("SKIP")


pkgver() {
	cd "${Name}"
	git rev-list --count HEAD
}


package () {
	install -Dm755 "${srcdir}/${Name}/program/${Name}" "${pkgdir}/usr/bin/${Name}"
	install -Dm644 "${srcdir}/${Name}/program/${Name}.1" "${pkgdir}/usr/share/man/man1/${Name}.1"
}

