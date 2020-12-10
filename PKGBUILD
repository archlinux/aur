# Maintainer: Jonathon Fernyhough <jonathon+m2x@dev>
# Contributor: Leo <olorin12+gmail+com>

pkgname=hypnotix
pkgver=1.3
pkgrel=1
pkgdesc="An IPTV app"
arch=(any)
url="https://github.com/linuxmint/hypnotix"
license=(GPL3)
depends=(dconf hicolor-icon-theme python-cairo python-imdbpy python-requests python-setproctitle mpv xapp)
source=($url/archive/$pkgver.tar.gz)
b2sums=('9bf53b5dd6768e2ef8d4474b8875bbccb3aeeaf77707e59c8ce5f2359b126c0e4abd1cb0120586f6c8fee4c54b3d61368d298b7763b12bed937d906402b13ada')

build() {
	cd $pkgname-$pkgver
	make
}

package() {
	cd $pkgname-$pkgver
	install -D     -t "$pkgdir"/usr/bin usr/bin/hypnotix
	install -D     -t "$pkgdir"/usr/lib/hypnotix usr/lib/hypnotix/{common,hypnotix}.py
	install -Dm644 -t "$pkgdir"/usr/lib/hypnotix usr/lib/hypnotix/mpv.py
	install -Dm644 -t "$pkgdir"/usr/share/applications usr/share/applications/hypnotix.desktop
	install -Dm644 -t "$pkgdir"/usr/share/glib-2.0/schemas usr/share/glib-2.0/schemas/org.x.hypnotix.gschema.xml
	install -Dm644 -t "$pkgdir"/usr/share/hypnotix usr/share/hypnotix/*.{css,png,ui}
	install -Dm644 -t "$pkgdir"/usr/share/hypnotix/pictures usr/share/hypnotix/pictures/*.svg
	install -Dm644 -t "$pkgdir"/usr/share/hypnotix/pictures/badges usr/share/hypnotix/pictures/badges/*
	install -Dm644 -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps usr/share/icons/hicolor/scalable/apps/hypnotix.svg
}
