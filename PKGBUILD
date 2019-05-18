#! /bin/bash
#  (GPL3+) Alberto Salvia Novella (es20490446e.wordpress.com)

Name="execute"
pkgname="${Name}-git"
pkgver=r16.241a46f
pkgrel=4
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


package () {
	"${srcdir}/${Name}/installer" "-install" "${pkgdir}"
}


pkgver() {
	cd "${srcdir}/${Name}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
