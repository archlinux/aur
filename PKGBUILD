# Maintainer: Totor <totor.linuxdev@gmail.com>
pkgname='vetch'
pkgver=1.0
pkgrel=1
pkgdesc="Veeeeery Tiny Fetch"
arch=('x86_64')
url="https://github.com/eeec-cal/vetch"
license=('MIT')
groups=('torkit')
depends=('viu' 'wmctrl')
makedepends=('git')
source=("vetch::git+https://github.com/eeec-cal/vetch")
sha256sums=('SKIP')



prepare() {
	cd vetch
	chmod +x vetch
}

build() {
	cd vetch

}

package() {
	cd vetch
	sudo mv vetch /usr/bin/
	if [[ -d ~/.config/vetch ]]; then
		if [[ -e ~/.config/vetch/config ]]; then
			printf ""
		else
			mv config ~/.config/vetch/
		fi
	else
		mkdir ~/.config/vetch/
		mv config ~/.config/vetch/
	fi
}
