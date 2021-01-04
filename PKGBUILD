# Maintainer: agilob <archlinux@agilob.net>
pkgname=nault-bin
pkgver=1.8.8
pkgrel=1
pkgdesc='Official Nault AppImage client'
arch=('x86_64')
url='https://github.com/Nault/Nault'
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=(!strip)
_appimage="nault.AppImage"
source=("https://github.com/Nault/Nault/releases/download/v${pkgver}/Nault-${pkgver}-Linux.AppImage")
noextract=("${_appimage}")
sha512sums=('6c842e1f1d1874e0129e6b77416238a6fecc96d8ed480dff100695edceb5c3eae4421aa5b5ff69f63f94d4d1b4059c6af3f954bdd6de306c52232d61159982f3')
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
