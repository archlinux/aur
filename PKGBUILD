# Maintainer: Pavel Sibal <entexsoft@gmail.com>
pkgname=xts-macos-white-sur-theme
pkgver=0.1
pkgrel=4
pkgdesc="macOS White Sur themes for xfce4-theme switcher."
arch=('any')
url="https://gitlab.com/linux-stuffs/xts-themes"
license=('GPL3')
groups=('xfce4-goodies')
provides=("${pkgname}")
conflicts=('xts-macos-big-sur-theme' 'xts-macos-sierra-theme' 'xts-macos-yosemite-theme')
replaces=('xts-macos-big-sur-theme' 'xts-macos-sierra-theme' 'xts-macos-yosemite-theme')
depends=('xfce4-theme-switcher' 'xfce4-whiskermenu-plugin' 'xfce4-terminal' 'gtk-engine-murrine' 'gtk-engines' 'plank' 'whitesur-gtk-theme' 'whitesur-icon-theme' 'whitesur-cursor-theme-git' 'rofi')
options=('!strip')
source=('https://gitlab.com/linux-stuffs/xts-themes/-/raw/main/xts-macos-white-sur-theme/distrib/xts-macos-white-sur-theme-0.1-4.tar.gz')

sha256sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}"
	./configure  --prefix=/usr
	make install DESTDIR="${pkgdir}"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp --no-preserve=ownership "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
