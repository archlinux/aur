# Maintainer: agilob <archlinux@agilob.net>
pkgname=tutanota-desktop-linux
pkgver=3.45.2
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
sha512sums=('c44314b4fecf9073c179a681b393668d34fb710e1166532bb426867c946dfd3bd067855ee8d0218344d491af0aa8f1c5cb957e6de262a6543c392f4226b61550')

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
