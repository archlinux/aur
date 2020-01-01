# Maintainer: Pavel Sibal <entexsoft@gmail.com>
pkgname=xts-macos-theme
pkgver=0.1
pkgrel=0
pkgdesc="macOS themes for xfce4-theme switcher."
arch=('any')
url="https://gitlab.com/linux-stuffs/xts-themes"
license=('combined licenses')
groups=('xfce4-goodies')

provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('xfce4-theme-switcher' 'xfce4-whiskermenu-plugin' 'gtk-engine-murrine' 'gtk-engines' 'plank')
optdepends=('conky-manager')
options=('!strip')

source=('https://gitlab.com/linux-stuffs/xts-themes/raw/master/xts-macos-theme/distrib/xts-macos-theme-0.1-0.tar.gz')
sha256sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}"
	./configure  --prefix=/usr
	make install DESTDIR="${pkgdir}"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp --no-preserve=ownership "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
