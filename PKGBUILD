# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gnome-shell-extension-transparent-window-moving-git
pkgver=r19.12eb05f
pkgrel=1
pkgdesc="Makes the window semi-transparent when moving or resizing."
arch=('any')
url="https://github.com/Noobsai/transparent-window-moving"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
source=("${pkgname}::git+https://github.com/Noobsai/transparent-window-moving.git")
sha256sums=('SKIP')

pkgver() {
	cd ${pkgname}

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd ${pkgname}

	make EXTENSIONDIR="${pkgdir}/usr/share/gnome-shell/extensions/" install
}
