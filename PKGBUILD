pkgname=vimix-gtk-themes-git
_pkgname=vimix-gtk-themes
pkgdesc='Vimix is a flat Material Design theme for GTK 3, GTK 2 and Gnome-Shell which supports GTK 3 and GTK 2 based desktop environments like Gnome, Unity, Budgie, Pantheon, XFCE, Mate, etc.'
pkgver=34.de031ad
pkgrel=1
arch=('any')
depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
source=('Install.patch'
		'git+https://github.com/vinceliuice/vimix-gtk-themes.git')
url='https://github.com/vinceliuice/vimix-gtk-themes'
md5sums=('SKIP'
		 'SKIP')
makedepends=('git' 'patch')
pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
build() {
	cd "${srcdir}/${_pkgname}"
	patch Install < "${srcdir}/Install.patch"
}
package() {
	cd "${srcdir}/${_pkgname}"
	install -m755 -d "${pkgdir}/usr/share/themes"
	DEST_DIR="${pkgdir}/usr/share/themes" ./Install
}
