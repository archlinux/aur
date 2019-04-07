#! /bin/bash
#  (GPL3+) Alberto Salvia Novella (es20490446e.wordpress.com)

Name="batman"
pkgname="${Name}-git"
pkgver=r2.a23cddd
pkgrel=1
pkgdesc="Opens bat files as if they were native"
arch=("x86_64")
url="https://gitlab.com/es20490446e/${Name}"
license=("GPL3")
makedepends=("git")
depends=("dosbox-svn")
optdepends=("execute-git: opens exe files")
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
