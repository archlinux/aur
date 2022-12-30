# Maintainer: L B
pkgname=asusctltray-git
pkgver=r23.99a8731
pkgrel=1
pkgdesc="Simple tray profile switcher for asusctl"
url="https://github.com/Baldomo/asusctltray"
license=("MIT")
arch=("any")
depends=("python3" "supergfxctl" "asusctl" "dbus" "dbus-python")
makedepends=("git")
provides=("asusctltray")
conflicts=("asusctltray")
source=("${pkgname%-git}::git+https://github.com/Baldomo/asusctltray.git")
md5sums=("SKIP")

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${pkgname%-git}"
	install -D asusctltray "${pkgdir}/usr/local/bin/asusctltray"
	install -D asusctltray.svg "${pkgdir}/usr/share/pixmaps/asusctltray.svg"
	install -D asusctltray.desktop "${pkgdir}/usr/share/applications/asusctltray.desktop"
}
