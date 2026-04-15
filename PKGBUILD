# Maintainer: Charlton Moren <charlton.moren@gmail.com>
pkgname=rage-gothic-cursor-theme
pkgver=1.0
pkgrel=1
pkgdesc="Rage Gothic — X11/Wayland cursor theme (dark + light variants)"
arch=('any')
url="https://www.gnome-look.org/p/1280103"
license=('custom')
# Upstream ships two archives for this theme (dark + light). Both install
# as siblings under /usr/share/icons/. Pick one via gtk-cursor-theme-name
# or XCURSOR_THEME: "Rage-Gothic" or "Rage-Gothic-Light".
source=(
	"$pkgname-gothic-$pkgver.tar::https://github.com/veasman/kara-cursor-mirror/releases/download/v1/Rage-Gothic.tar.gz"
	"$pkgname-gothic-light-$pkgver.tar::https://github.com/veasman/kara-cursor-mirror/releases/download/v1/Rage-Gothic-Light.tar.gz"
)
sha256sums=(
	'8bf0401068ad8e89a0ec04881a3cd08db38de3aa7ca51a360048187b736a6dd3'
	'50f3ce556405a38db686a19f5c82a2b248e078d5932f3c8eb182fe0b73b585f9'
)

package() {
	install -dm755 "$pkgdir/usr/share/icons"
	cp -r "$srcdir/Rage-Gothic"       "$pkgdir/usr/share/icons/Rage-Gothic"
	cp -r "$srcdir/Rage-Gothic-Light" "$pkgdir/usr/share/icons/Rage-Gothic-Light"
	chmod -R u=rwX,go=rX "$pkgdir/usr/share/icons/Rage-Gothic" \
	                      "$pkgdir/usr/share/icons/Rage-Gothic-Light"
}
