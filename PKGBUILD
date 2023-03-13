# Maintainer: Pavel Sibal <entexsoft@gmail.com>
pkgname=xts-dark-theme
pkgver=0.1
pkgrel=2
pkgdesc="Dark theme for xfce4-theme switcher."
arch=('any')
url="https://gitlab.com/linux-stuffs/xts-themes"
license=('GPL3')
groups=('xfce4-goodies')

provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('xfce4-theme-switcher' 'xfce4-whiskermenu-plugin' 'arc-gtk-theme' 'gtk-engines' 'plank' 'conky' 'rofi' 'sardi-icons')
options=('!strip')

source=('https://gitlab.com/linux-stuffs/xts-themes/-/raw/main/xts-dark-theme/distrib/xts-dark-theme-0.1-2.tar.gz')
sha256sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}"
	./configure  --prefix=/usr
	make install DESTDIR="${pkgdir}"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp --no-preserve=ownership "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
