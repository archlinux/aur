# Maintainer: Robosky <fangyuhao0612@gmail.com>

pkgname=gnome-shell-extension-netspeed-git
_gitname=NetSpeed
pkgver=119.b2eef96
pkgrel=1
pkgdesc="Gnome shell extension to display internet speed"
arch=('any')
url="https://extensions.gnome.org/extension/104/netspeed"
license=('GPL2')
depends=('gnome-shell')
makedepends=('git' 'zip' 'unzip')
install=${pkgname}.install
source=("git+https://github.com/hedayaty/NetSpeed.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "${srcdir}/${_gitname}"
	make
}

package() {
	cd "${srcdir}/${_gitname}"
	install -d "${pkgdir}/"usr/share/gnome-shell/extensions/netspeed@hedayaty.gmail.com
	make LOCAL_INSTALL="${pkgdir}/"usr/share/gnome-shell/extensions/netspeed@hedayaty.gmail.com install
}

 
