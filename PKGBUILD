# Maintainer: agilob <archlinux@agilob.net>
# Contributor: Aaron J. Graves <linux@ajgraves.com>
pkgname=tutanota-desktop-linux
pkgver=3.55.2
pkgrel=1
pkgdesc='Official Tutanota email client'
arch=('x86_64')
url='https://tutanota.com/blog/posts/desktop-clients/'
license=('GPL3')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=(!strip)
_appimage="tutanota-desktop-linux.AppImage"
source=("https://mail.tutanota.com/desktop/tutanota-desktop-linux.AppImage")
noextract=("${_appimage}")
sha512sums=('SKIP')
install="${pkgname}.install"

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
#	install -d "${pkgdir}/usr/bin"
#	ln -s "../../opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/${pkgname}"
}
