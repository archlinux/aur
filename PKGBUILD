# Maintainer: Majenko <matt@majenko.co.uk>
pkgname=tu58fs-git
pkgver=1.2.0.r13.gafe0bcb
pkgrel=1
pkgdesc="Filesharing between DEC PDP-11 and modern hardware over TU58 tape emulator"
arch=('any')
url=https://github.com/j-hoppe/tu58fs
license=('BSD')

source=("git+https://github.com/j-hoppe/tu58fs")
cksums=(SKIP)

pkgver() {
  cd "tu58fs"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "tu58fs"
	make
}

package() {
	cd "tu58fs"
    mkdir -p "$pkgdir/usr/bin"
    install -m 755 bin-*/tu58fs "$pkgdir/usr/bin"
}
