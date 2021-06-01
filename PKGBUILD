# Maintainer: Alex S. shantanna_at_hotmail_dot_com>

pkgname=gnome-shell-extension-shutdowntimer-git
pkgver=v30.r0.g678558a
pkgrel=2
pkgdesc="Shutdown your device after a specific time. This extension adds a submenu to the status area."
arch=('any')
url="https://github.com/neumann-d/ShutdownTimer"
license=('unknow')
conflicts=('gnome-shell-extension-shutdowntimer')
depends=('gnome-shell')
source=("git+https://github.com/neumann-d/ShutdownTimer.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/ShutdownTimer"
	mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
	cp -af "ShutdownTimer@neumann" "${pkgdir}/usr/share/gnome-shell/extensions/"
}
