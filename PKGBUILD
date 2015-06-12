# Mantainer: Marcin Tydelski <marcin.tydelski@gmail.com>
# Contributor: TheArakAttack <http://thearakattack.deviantart.com/>

pkgname=vold2-gtk-theme
pkgver=2014.03.19
pkgrel=1
pkgdesc="The successor of Vold GTK Theme with semi-material design influences and authentic flat, based on Iris Dark theme."
arch=('any')
url="http://www.deviantart.com/art/Vold-2-The-Next-Chapter-514696085"
license=('GPL3')
depends=('gtk3')
_sourcefile=168976-vold2-theme_1.2.tar.xz
source=("http://gnome-look.org/CONTENT/content-files/"${_sourcefile})
md5sums=('SKIP')

noextract=("${source[@]%%::*}")
_foldername=vold2-theme

package() {
	mkdir "${srcdir}/${_foldername}"
	tar -xf "${_sourcefile}" #/usr/share/themes/
	install -dm 755 "${pkgdir}"/usr/share/themes/
  	rm -rf vold2-theme ${_sourcefile}
  	cp -dr --no-preserve='ownership' * "${pkgdir}"/usr/share/themes/
}