#! /bin/bash

SourcePath="https://gitlab.com/es20490446e/darkmod-linux-packager"

pkgver () {
	curl --silent "${SourcePath}/raw/master/package%20version.sh" |
	bash
}

build () {
	"${srcdir}/darkmod-linux-packager/build.sh"
}

package () {
	mv "${srcdir}/darkmod-linux-packager/build/usr" "${pkgdir}"
}

pkgname="darkmod"
provides=("${pkgname}")
conflicts=("${pkgname}")

arch=("x86_64")
pkgver=$(pkgver)
pkgrel=1

pkgdesc="First person forgery stealth game"
license=("GPL3" "BSD" "CCPL:by-nc-sa")
url="http://www.thedarkmod.com"

source=("git+${SourcePath}.git")
md5sums=("SKIP")

depends=("curl" "glew" "libjpeg-turbo" "libpng" "libpng12" "libpulse" "libxxf86vm" "openal" "silently")
makedepends=("git" "unzip")

