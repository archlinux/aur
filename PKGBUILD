# Maintainer: Dimitris Kiziridis <ragouel@outlook.com>

pkgname=('arc-icon-theme-full-git')
pkgver=1.0.r100.gae267dc
pkgrel=1
pkgdesc="The complete Arc icon theme."
arch=('any')
url="https://github.com/rtlewis88/rtl88-Themes/tree/Arc-ICONS"
license=('Creative Commons')
makedepends=('git')
optdepends=('arc-gtk-theme' 'arc-solid-gtk-theme')
provides=("${pkgname%-*}" "${pkgname}" "arc-icon-theme")
conflicts=("${pkgname%-*}" "${pkgname}" "arc-icon-theme")
options=('!strip')

pkgver() {
	cd "$srcdir"/rtl88-Themes/Arc-ICONS
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	git clone --single-branch --branch "Arc-ICONS" https://github.com/rtlewis88/rtl88-Themes   
 	cd "$srcdir"/rtl88-Themes/Arc-ICONS
}

package() {
	install -dm 755 "$pkgdir"/usr/share/icons/Arc-ICONS
	cp -r "$srcdir"/rtl88-Themes/Arc-ICONS/* ${pkgdir}/usr/share/icons/Arc-ICONS/
}
