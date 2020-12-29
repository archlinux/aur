# Maintainer: Radu Bîrzu <radu@webative.net>

pkgname=dracula-openbox-theme
_pkgname=Dracula
pkgver=r11.b322250
pkgrel=1
pkgdesc="A dark theme for Openbox WM based on the Dracula color scheme. It is compatible with the Ant-Dracula GTK and KDE themes."
arch=("any")
url="https://github.com/the-zero885/dracula-Openbox"
license=('GPL')
optdepends=('ttf-roboto: primary font face defined'
	'ttf-ubuntu-font-family: secondary font face defined'
	'cantarell-fonts: tertiary font face defined')
source=("${_pkgname}::git+https://github.com/the-zero885/dracula-Openbox.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	msg2 "To activate the theme, run \"obmenu\" in terminal:"
}

package() {
	cd "${srcdir}/${_pkgname}"

	mkdir -p "${pkgdir}/usr/share/themes/${_pkgname}"
	cp -a "${srcdir}/${_pkgname}/${_pkgname}/"* "${pkgdir}/usr/share/themes/${_pkgname}/"
}
