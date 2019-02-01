# Maintainer: agilob <archlinux@agilob.net>
pkgname=tutanota-desktop-linux
pkgver=3.46.1
pkgrel=1
pkgdesc='Official Tutanota email client'
arch=('x86_64')
url='https://tutanota.com/blog/posts/desktop-clients/'
license=('unknown')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=(!strip)
_appimage="tutanota-desktop-linux.AppImage"
source=("https://mail.tutanota.com/desktop/tutanota-desktop-linux.AppImage")
noextract=("${_appimage}")
sha512sums=('b3e6e32b960252c6ed18cbcf8d90c08ce2a2192991016395fe17a2d042ba8ea68c90c600ca9c323fc279f652897476f51505f4696e6c18ed4cf3bcde5c7ab9ba')

# extracting icons doesnt work now, this is here for future purposes
# prepare() {
# 	bsdcpio --extract --make-directories --insecure 'tutanota-desktop-linux.desktop' '.DirIcon' 'usr/share/icons' < "${_appimage}"
# }

# build() {
# 	sed -i -E "s|Exec=AppRun|Exec=${_pkgname}|" tutanota-desktop-linux.desktop
# 	chmod -R g-w,o-w usr/share/icons
# }

package() {
	install -Dpm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"
	install -d "${pkgdir}/usr/bin"
	ln -s "../../opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/${pkgname}"
# 	install -Dpm644 'tutanota-desktop-linux.desktop' "${pkgdir}/usr/share/applications/${pkgname}.desktop"
# 	install -d "${pkgdir}/usr/share/icons"
# 	cp -a usr/share/icons/default "${pkgdir}/usr/share/icons/hicolor"
}
