####
# Maintainer: Kamil Cukrowski <kamilcukrowski@gmail.com>

pkgbase=
pkgname=kamil-scripts-crypted
pkgver=0.3.1.r3.g8242aea
pkgrel=3
epoch=
pkgdesc="Kamil Cukrowski crypted private package with custom scripts. Do NOT USE"
arch=(any)
url="https://github.com/Kamilcuk/$pkgname"
license=('MIT' 'custom:Beerware')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+${url}.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$pkgname"
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {
	cd "$pkgname"
	git-crypt unlock
	cp -a resources/* "$pkgdir"
	chown -R root:root "$pkgdir"
}
