# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
pkgname="mkb-git"
_pkgname="mkb"
pkgver=r5.55b2989
pkgrel=1
pkgdesc='progress bar maker'
arch=('i686' 'x86_64' 'aarch64')
url='http://git.2f30.org/mkb/'
license=('unknown')
provides=('mkb')
conflicts=('mkb')
makedepends=('git')
source=('git://git.2f30.org/mkb.git')
sha1sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    make clean
    make all
}

package() {
    cd "${_pkgname}"
    make DESTDIR="${pkgdir}" MANPREFIX="/usr/share/man" install
}
