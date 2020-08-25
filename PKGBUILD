# Maintainer: agilob <archlinux@agilob.net>
pkgname=nault-bin
pkgver=1.7.6
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
sha512sums=('4e20f110ee6da7c3bbbe2fba47184ea6cc37dba9bb76916e35efbaca12d2647b72e0aa2e9965775f8ffcf03760d3a374a078a50e6e3263cab46c06f9adaf742a')
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
