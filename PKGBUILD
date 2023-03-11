# Maintainer: Pavel Sibal <entexsoft@gmail.com>
pkgname=xts-windows-server-2003-theme
pkgver=0.1
pkgrel=1
pkgdesc="Windows Server 2003 theme for xfce4-theme switcher."
arch=('any')
url="https://gitlab.com/linux-stuffs/xts-themes"
license=('combined licenses')
groups=('xfce4-goodies')

provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('xfce4-theme-switcher' 'xfce4-whiskermenu-plugin' 'gtk-engine-murrine')
options=('!strip')

source=('https://gitlab.com/linux-stuffs/xts-themes/-/raw/main/xts-windows-server-2003-theme/distrib/xts-windows-server-2003-theme-0.1-1.tar.gz')
sha256sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}"
	./configure  --prefix=/usr
	make install DESTDIR="${pkgdir}"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp --no-preserve=ownership "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
