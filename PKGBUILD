# Maintainer: Kittyy <laosnepada3@proton.me>
pkgname='smol'
pkgver=1.2
pkgrel=1
pkgdesc="Simple Fetch Script"
arch=('x86_64')
url="https://github.com/eeec-cal/smol"
license=('VPL')
makedepends=('git')
source=("smol::git+https://github.com/eeec-cal/smol")
sha256sums=('SKIP')



prepare() {
	cd smol
	chmod +x smol
}

build() {
	cd smol

}

package() {
	cd smol
	sudo mv smol /usr/bin/
	if [[ -d ~/.config/smol ]]; then
		if [[ -e ~/.config/smol/config ]]; then
			printf ""
		else
			mv config ~/.config/smol/
		fi
	else
		mkdir ~/.config/smol/
		mv config ~/.config/smol/
	fi
}
