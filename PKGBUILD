# Maintainer: Charlton Moren <charlton.moren@gmail.com>
pkgname=moonlight-cursor-theme
pkgver=1.0
pkgrel=1
pkgdesc="Moonlight — X11/Wayland cursor theme"
arch=('any')
url="https://www.gnome-look.org/p/1341926"
license=('CCPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/veasman/kara-cursor-mirror/releases/download/v1/Moonlight.tar.gz")
sha256sums=('879bd8c09a1588f1bb77dcfc14d35126df63171dfb629d315073c7580752b0df')

package() {
	install -dm755 "$pkgdir/usr/share/icons"
	cp -r "$srcdir/Moonlight" "$pkgdir/usr/share/icons/Moonlight"
	# Upstream ships a Creative Commons PDF + readme + logo inside the
	# theme dir; strip non-theme artifacts.
	rm -f "$pkgdir/usr/share/icons/Moonlight"/*.pdf \
	      "$pkgdir/usr/share/icons/Moonlight"/*.png \
	      "$pkgdir/usr/share/icons/Moonlight/readme"
	chmod -R u=rwX,go=rX "$pkgdir/usr/share/icons/Moonlight"
}
