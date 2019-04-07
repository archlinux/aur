#! /bin/bash
#  (GPL3+) Alberto Salvia Novella (es20490446e.wordpress.com)

Name="execute"
pkgname="${Name}-git"
pkgver=r11.1bc0822
pkgrel=2
pkgdesc="Opens exe files as if they were native"
arch=("x86_64")
url="https://gitlab.com/es20490446e/${Name}"
license=("GPL3")
makedepends=("git")
depends=("batman-git" "dosbox-svn" "q4wine" "wine_gecko" "wine-mono")
provides=("${Name}")
conflicts=("${Name}")
source=("git+${url}.git")
md5sums=("SKIP")


package () {
	"${srcdir}/${Name}/installer" "-install" "${pkgdir}"
}


pkgver() {
	cd "${srcdir}/${Name}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
