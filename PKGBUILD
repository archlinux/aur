# Maintainer: Santiago Pedroza Díaz <santpedrozadiaz@gmail.com>
pkgname=organice-git
pkgver=1..
pkgrel=1
pkgdesc="Organice is a tool to move files by extension or part of their name from the command line in an easy way."
arch=(x86_64)
url="https://github.com/snat-s/organice"
license=('GPL')
depends=()
makedepends=(git make)
optdepends=()
provides=(organice)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "1.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd organice	
	make DESTDIR="$pkgdir/" install
}
