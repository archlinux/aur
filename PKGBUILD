#! /bin/bash

Name="silently"
pkgname="${Name}-git"
pkgver=r5.3a67f98
pkgrel=1
pkgdesc="Silences a command output except on error, so its correct operation is self supervised (aka jidoka)"
arch=("x86_64")
url="https://gitlab.com/es20490446e/${Name}"
license=("GPL3")
makedepends=("git")
depends=("bash")
provides=("${Name}")
conflicts=("${Name}")
source=("git+${url}.git")
md5sums=("SKIP")


pkgver() {
	cd "${Name}"
	printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package () {
	install -Dm755 "${srcdir}/${Name}/program/${Name}" "${pkgdir}/usr/bin/${Name}"
	install -Dm644 "${srcdir}/${Name}/program/${Name}.1" "${pkgdir}/usr/share/man/man1/${Name}.1"
}

