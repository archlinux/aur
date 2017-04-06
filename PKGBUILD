# Maintainer: Bastian Löher <b.loeher@gsi.de>
pkgname=ucesb-git
pkgver=git
pkgrel=1
pkgdesc="UCESB - unpack & check every single bit"
arch=('x86_64')
url="http://fy.chalmers.se/~f96hajo/ucesb/"
license=('LGPL2')
groups=()
depends=()
makedepends=(
	'git'
	'ncurses')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=${pkgname%-git}.install
source=("${pkgname%-git}::git+http://fy.chalmers.se/~f96hajo/ucesb/ucesb.git"
	"${pkgname%-git}.install")
noextract=()
md5sums=('SKIP'
         '675ab1abaf4a405ec613ff94bfc1c7a6')
changelog=

# Do not compress the package for installation
# PKGEXT='.pkg.tar'
# Compress using lightweight gzip
PKGEXT='.pkg.tar.gz'

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" \
	    "$(git rev-parse --short HEAD)"
}

prepare() {
	:
}

build() {
	# Building is done in the installation path, because ucesb does not
	# fully support an 'installation' step.
	:
}

check() {
	:
}

package() {
	installdir=${pkgdir}/opt
	export installdir
	mkdir -p ${installdir}
	cp -r ${srcdir}/${pkgname%-git} ${installdir}
}
