# Maintainer: Pavel Sibal <entexsoft@gmail.com>
pkgname=xts-widows95-theme
pkgver=0.1
pkgrel=2
pkgdesc="MS Windows 95 (Chicago) themes for xfce4-theme switcher."
arch=('any')
url="https://gitlab.com/linux-stuffs/xts-themes"
license=('combined licenses')
groups=('xfce4-goodies')

provides=("${pkgname}")
conflicts=("${pkgname}" "xts-windows95-theme")
depends=('xfce4-theme-switcher' 'xfce4-whiskermenu-plugin' 'gtk-engines' 'chicago95-gtk-theme-git' 'chicago95-icon-theme-git' 'xcursor-chicago95-git')
options=('!strip')

source=('https://gitlab.com/linux-stuffs/xts-themes/-/raw/main/xts-widows95-theme/distrib/xts-widows95-theme-0.1-2.tar.gz')
sha256sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}"
	./configure  --prefix=/usr
	make install DESTDIR="${pkgdir}"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp --no-preserve=ownership "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
