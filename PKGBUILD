pkgname=asusctltray-upgraded-git
pkgver=r34.cbe3a80
pkgrel=1
pkgdesc="Simple tray profile switcher for asusctl with some fixes/improvements"
url="https://github.com/alexjonker/asusctltray"
license=("MIT")
arch=("any")
depends=("python3" "supergfxctl" "asusctl" "dbus" "dbus-python")
makedepends=("git")
provides=("asusctltray")
conflicts=("asusctltray" "asusctltray-git")
source=("${pkgname%-git}::git+https://github.com/alexjonker/asusctltray.git")
md5sums=("SKIP")


pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${pkgname%-git}"
	install -D asusctltray "${pkgdir}/usr/local/bin/asusctltray"
	install -D asusctltray.png "${pkgdir}/usr/share/pixmaps/asusctltray.png"
	install -D asusctltray.desktop "${pkgdir}/usr/share/applications/asusctltray.desktop"
}
