# Maintainer: Paweł Lidwin <linguin@tutanota.com>

pkgname=jelly-desktop
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple community made desktop client for Jellyfin"
arch=("x86_64")
url="https://github.com/imLinguin/jelly-desktop"
license=("GPL3")
_filename=jelly-desktop-${pkgver}.pacman
source=("${pkgname}::git+${url}.git")
md5sums=("SKIP")
provides=("jelly-desktop")
makedepends=("nodejs" "npm")
build() {
	cd "jelly-desktop"
	npm install
	npm run build:ts
	npm run build:aur
}

package(){
	tar -xJv -C "${pkgdir}" -f "${srcdir}/jelly-desktop/dist/${_filename}" usr opt
	mkdir "$pkgdir/usr/bin"
	ln -s "/opt/Jelly Desktop/jelly-desktop" "$pkgdir/usr/bin/jelly-desktop"
	
}
