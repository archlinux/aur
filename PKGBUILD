# Maintainer: Jonathon Fernyhough <jonathon+m2x@dev>

pkgname=hypnotix
pkgver=1.0.0
pkgrel=2
pkgdesc="An IPTV app"
arch=(any)
url="https://github.com/linuxmint/hypnotix"
license=(unknown)
depends=(dconf hicolor-icon-theme lua51 python-requests python-setproctitle mpv xapp)
source=("git+$url.git#commit=5687e0e6db8069b02cbca8140f69aa8201999324")
b2sums=(SKIP)

build() {
	cd ${pkgname/-git}
	make
}

package() {
	cd ${pkgname/-git}
	install -D     -t "$pkgdir"/usr/bin usr/bin/hypnotix
	install -D     -t "$pkgdir"/usr/lib/hypnotix usr/lib/hypnotix/{common,hypnotix,mpv}.py
	install -Dm644 -t "$pkgdir"/usr/share/applications usr/share/applications/hypnotix.desktop
	install -Dm644 -t "$pkgdir"/usr/share/glib-2.0/schemas usr/share/glib-2.0/schemas/org.x.hypnotix.gschema.xml
	install -Dm644 -t "$pkgdir"/usr/share/hypnotix usr/share/hypnotix/{hypnotix,shortcuts}.ui
	install -Dm644 -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps usr/share/icons/hicolor/scalable/apps/hypnotix.svg
}
