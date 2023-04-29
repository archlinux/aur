# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gnome-shell-extension-transparent-window-moving-git
pkgver=r42.b485b29
pkgrel=1
pkgdesc="Makes the window semi-transparent when moving or resizing."
arch=('any')
url="https://github.com/Noobsai/transparent-window-moving.git"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${pkgname}"

	make EXTENSIONDIR="${pkgdir}/usr/share/gnome-shell/extensions/" install
}
