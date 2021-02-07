# Maintainer: agilob <archlinux@agilob.net>
pkgname=nault-bin
pkgver=1.9.6
pkgrel=1
pkgdesc='Official Nault AppImage client'
arch=('x86_64')
url='https://github.com/Nault/Nault'
license=('MIT')
provides=("${pkgname}")
depends=('fuse2')
conflicts=("${pkgname}")
options=(!strip)
_appimage="nault.AppImage"
source=("https://github.com/Nault/Nault/releases/download/v${pkgver}/Nault-${pkgver}-Linux.AppImage")
noextract=("${_appimage}")
sha512sums=('89c5a883dd573112da70fea45334755142d3dba2c5f89bf72a45adb2f9c3f56098e59518c209afb1b7ea0354dbfd99c50f3a32931f1845755d6587680f8312b2')
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
    mv "Nault-${pkgver}-Linux.AppImage" 'nault.AppImage'
	install -Dpm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"
}
