# Maintainer: tyyip0 <tyyip0@proton.me>
# Contributor: Tony Fettes <feihaoxiang2014@gmail.com>

pkgname=plasma5-themes-mondrian-git
_gitname=Mondrian
pkgver=r32.2450232
pkgrel=1
pkgdesc="Plasma themes based on Piet Mondrian's paintings."
arch=('any')
url='https://www.opencode.net/ju1464/Mondrian'
license=('GPL3')
optdepends=('plasma-desktop: for a plasma desktop theme'
	'mondrian-icon-theme-git: for icon theme'
	'mondrian-gtk-theme-git: for GTK theme')
makedepends=('git')
provides=('mondrian-kde')
conflicts=('mondrian-kde')
source=("git+${url}.git")
options=('!strip')
sha256sums=('SKIP')

pkgver() {
	cd ${_gitname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd ${srcdir}/${_gitname}/KDE-Plasma
	install -dm755 "${pkgdir}/usr/share"
	install -dm755 "${pkgdir}/usr/share/plasma"
	install -dm755 "${pkgdir}/usr/share/aurorae/themes"
	install -dm755 "${pkgdir}/usr/share/sddm/themes"
	install -dm755 "${pkgdir}/usr/share/wallpapers/Mondrian"
	cp -r aurorae/* "${pkgdir}/usr/share/aurorae/themes"
	cp -r color-schemes "${pkgdir}/usr/share"
	cp -r desktoptheme "${pkgdir}/usr/share/plasma"
	cp -r look-and-feel "${pkgdir}/usr/share/plasma"
	cp -r sddm/* "${pkgdir}/usr/share/sddm/themes"
	cp -r ${srcdir}/${_gitname}/Wallpaper/* "${pkgdir}/usr/share/wallpapers/Mondrian"
}
