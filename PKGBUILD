#! /bin/bash

Name="execute"
pkgname="${Name}-git"
pkgver=r19.940ea82
pkgrel=2
pkgdesc="Opens exe and bat files as if they were native"
arch=("x86_64")
url="https://gitlab.com/es20490446e/${Name}"
license=("GPL3")
makedepends=("git")
depends=("dosbox-svn" "q4wine" "wine_gecko" "wine-mono")
provides=("${Name}" "batman")
conflicts=("${Name}" "batman")
source=("git+${url}.git")
md5sums=("SKIP")
# fgiauerhgea


package () {
	"${srcdir}/${Name}/installer" "-install" "${pkgdir}"
}


pkgver() {
	cd "${Name}"
	printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
