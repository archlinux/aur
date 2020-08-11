# Maintainer: agilob <archlinux@agilob.net>
pkgname=nault-bin
pkgver=1.7.2
pkgrel=1
pkgdesc='Official Nault AppImage client'
arch=('x86_64')
url='https://github.com/Nault/Nault'
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=(!strip)
_appimage="nault.AppImage"
source=("https://github.com/Nault/Nault/releases/download/v${pkgver}/Nault-${pkgver}.AppImage")
noextract=("${_appimage}")
sha512sums=('ed21c663384059b7e39a0e8f407a8fabea98e96780e67d184441a6e24fa17acf8c5bb6635692c4b7f6ab4c2dc02f38f391f0cd51a45933441e09b6ae849d52ec')
install="${pkgname}.install"

# extracting icons doesnt work now, this is here for future purposes
# prepare() {
# 	bsdcpio --extract --make-directories --insecure 'nano-vault' '.DirIcon' 'usr/share/icons' < "${_appimage}"
# }

# build() {
# 	sed -i -E "s|Exec=AppRun|Exec=${_pkgname}|" nano-vault.desktop
# 	chmod -R g-w,o-w usr/share/icons
# }

package() {
    mv "Nault-${pkgver}.AppImage" 'nault.AppImage'
	install -Dpm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"
}
