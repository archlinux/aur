# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gnome-shell-extension-caffeine-plus-git
pkgver=r174.a6fba34
pkgrel=1
pkgdesc="Disable screensaver and auto suspend"
arch=('any')
url="https://github.com/tonylambiris/gnome-shell-extension-caffeine-plus.git"
install=caffeine-plus.install
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
source=("${pkgname}::git+https://github.com/tonylambiris/gnome-shell-extension-caffeine-plus.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname}"

	/bin/sh -ex ./build.sh
}

package() {
	cd "${pkgname}"

	install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions"
	cp -a "caffeine-plus@patapon.info" "${pkgdir}/usr/share/gnome-shell/extensions"
}
