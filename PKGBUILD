# Maintainer: James

pkgname=gnome-pywalfox-theme
pkgver=0.1.0
pkgrel=1
pkgdesc='Pywalfox color patcher for firefox-gnome-theme'
arch=('any')
url='https://github.com/JamesFromFL/gnome-pywalfox-theme'
license=('MPL-2.0')
depends=('firefox-gnome-theme')
install='gnome-pywalfox-theme.install'
source=(
	'patch-gnome-firefox-theme'
	'pywalfox-colors.css'
	'90-gnome-pywalfox-theme.hook'
	'LICENSE'
)
sha256sums=(
	'776ceec74ee0b96fade84c71936bf8d360a173663c37099895eb1a31f728fcc4'
	'b153d9f564a79fd5de89200f5e35d4219c7695905741d37e3d0aab5178b5a7c7'
	'1b79206a28ee5f1648d63ac8ca215009c637d2a741dad402c30d5d1e6275cb9c'
	'1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5'
)

package() {
	install -Dm755 "$srcdir/patch-gnome-firefox-theme" "$pkgdir/usr/bin/gnome-pywalfox-theme-patch"
	install -Dm644 "$srcdir/pywalfox-colors.css" "$pkgdir/usr/share/gnome-pywalfox-theme/pywalfox-colors.css"
	install -Dm644 "$srcdir/90-gnome-pywalfox-theme.hook" "$pkgdir/usr/share/libalpm/hooks/90-gnome-pywalfox-theme.hook"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
