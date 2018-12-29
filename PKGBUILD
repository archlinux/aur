# Maintainer: agilob <archlinux@agilob.net>
pkgname=tutanota-desktop-linux
pkgver=0.1
pkgrel=0.1
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
sha512sums=('be09abdf72bda028cb81fc894614b22c6b3d31301d0b39940edac3aa71cd956b898fcbbfa2a4d195eb8a4a611cd6934544c797383bb363497fdafe8eac236739')

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
