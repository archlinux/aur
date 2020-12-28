# Maintainer: Radu Bîrzu <radu@webative.net>

pkgname=dracula-gtk-theme-git
pkgver=r136.71e6a55
pkgrel=1
pkgdesc="This theme provides support for GTK-3 and GTK-2 based desktop environments like Gnome, Unity, Budgie, Pantheon, XFCE, Mate, etc. Also provides support for KDE plasma."
arch=("any")
url="https://github.com/dracula/gtk"
license=('GPL')
optdepends=('ttf-roboto: primary font face defined'
	'ttf-ubuntu-font-family: secondary font face defined'
	'cantarell-fonts: tertiary font face defined')
source=("${pkgname}::git+https://github.com/dracula/gtk.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"

	msg2 "To activate the theme in Gnome, run the following commands in Terminal:"
	msg2 ""
	msg2 "gsettings set org.gnome.desktop.interface gtk-theme \"Dracula\""
	msg2 "gsettings set org.gnome.desktop.wm.preferences theme \"Dracula\""
	msg2 ""
	msg2 "or Change via distribution specific tweak tool."
}

package() {
	cd "${srcdir}/${pkgname}"

	mkdir -p "${pkgdir}/usr/share/themes/${pkgname}"
	cp -a "${srcdir}/${pkgname}/"* "${pkgdir}/usr/share/themes/${pkgname}/"
}
