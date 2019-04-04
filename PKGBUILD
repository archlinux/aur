#! /bin/bash

name="execute"
pkgname="${name}-git"
pkgver=r11.1bc0822
pkgrel=1
pkgdesc="Opens exe files as if they were native"
arch=("x86_64")
url="https://gitlab.com/es20490446e/${name}" #maintainer
license=("GPL3")
makedepends=("git")
depends=("dosbox-svn" "q4wine")
optdepends=("wine-mono" "wine_gecko")
provides=("${name}")
conflicts=("${name}")
source=("git+${url}.git")
md5sums=("SKIP")


package () {
	"${srcdir}/${name}/installer" "-install" "${pkgdir}"
}


pkgver() {
	cd "${srcdir}/${name}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
