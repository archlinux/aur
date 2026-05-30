# Maintainer: James

pkgname=gnome-pywalfox-theme
pkgver=0.1.4
pkgrel=1
pkgdesc='Pywalfox color patcher for firefox-gnome-theme'
arch=('any')
url='https://github.com/JamesFromFL/gnome-pywalfox-theme'
license=('MPL-2.0')
optdepends=(
	'firefox-gnome-theme: base theme to patch'
	'firefox-gnome-theme-git: development version of the base theme to patch'
)
install='gnome-pywalfox-theme.install'
source=(
	'patch-gnome-firefox-theme'
	'pywalfox-colors.css'
	'90-gnome-pywalfox-theme.hook'
	'LICENSE'
)
sha256sums=(
	'c0ccad8a17d6f07eebd7c7058896ba392c457c0096cc4b7f38f791dc7158899a'
	'312bbb30eaf7c9d46904d298d84f27bd5acffacd5d1280b75037c74cedb3ca17'
	'1b79206a28ee5f1648d63ac8ca215009c637d2a741dad402c30d5d1e6275cb9c'
	'1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5'
)

package() {
	install -Dm755 "$srcdir/patch-gnome-firefox-theme" "$pkgdir/usr/bin/gnome-pywalfox-theme-patch"
	install -Dm644 "$srcdir/pywalfox-colors.css" "$pkgdir/usr/share/gnome-pywalfox-theme/pywalfox-colors.css"
	install -Dm644 "$srcdir/90-gnome-pywalfox-theme.hook" "$pkgdir/usr/share/libalpm/hooks/90-gnome-pywalfox-theme.hook"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
