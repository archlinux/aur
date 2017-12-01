####
# Maintainer: Kamil Cukrowski <kamilcukrowski@gmail.com>

pkgbase=
pkgname=cukrowski.kamil-scripts-crypted
_gitname=${pkgname##*.}
pkgver=0.3.1.r10.g9f06ed8
pkgrel=1
epoch=
pkgdesc="Kamil Cukrowski crypted private package with custom scripts. Do NOT USE"
arch=(any)
url="https://github.com/Kamilcuk/${_gitname}"
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
source=("${_gitname}::git+${url}.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$_gitname"
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {
	cd "$_gitname"
	git-crypt unlock
	cp -a resources/* "$pkgdir"
	chown -R root:root "$pkgdir"
}
