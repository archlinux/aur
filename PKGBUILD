# Maintainer: Jonathon Fernyhough <jonathon+m2x@dev>

pkgname=hypnotix
pkgver=1.0.0
pkgrel=3
pkgdesc="An IPTV app"
arch=(any)
url="https://github.com/linuxmint/hypnotix"
license=(unknown)
depends=(dconf hicolor-icon-theme lua51 python-requests python-setproctitle mpv xapp)
_commit=5687e0e6db8069b02cbca8140f69aa8201999324
source=($url/archive/$_commit.tar.gz)
b2sums=('fb2e9a576ff57227f9877374d0ba3ad16935a0af06d9c750cbe6b5703a1455ccfac750578808ce418e16c2204c41323323ea811bf1cf09574e7622703419e19a')

build() {
	cd $pkgname-$_commit
	make
}

package() {
	cd $pkgname-$_commit
	install -D     -t "$pkgdir"/usr/bin usr/bin/hypnotix
	install -D     -t "$pkgdir"/usr/lib/hypnotix usr/lib/hypnotix/{common,hypnotix,mpv}.py
	install -Dm644 -t "$pkgdir"/usr/share/applications usr/share/applications/hypnotix.desktop
	install -Dm644 -t "$pkgdir"/usr/share/glib-2.0/schemas usr/share/glib-2.0/schemas/org.x.hypnotix.gschema.xml
	install -Dm644 -t "$pkgdir"/usr/share/hypnotix usr/share/hypnotix/{hypnotix,shortcuts}.ui
	install -Dm644 -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps usr/share/icons/hicolor/scalable/apps/hypnotix.svg
}
