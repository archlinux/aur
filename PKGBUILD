# Maintainer: agilob <archlinux@agilob.net>
pkgname=nano-vault-bin
pkgver=1.2.1
pkgrel=1
pkgdesc='Official Nano Vault AppImage client'
arch=('x86_64')
url='https://github.com/cronoh/nanovault'
#license=('GPL3')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=(!strip)
_appimage="nano-vault.AppImage"
source=("https://github.com/cronoh/nanovault/releases/download/v1.2.1/NanoVault-1.2.1-x86_64.AppImage")
noextract=("${_appimage}")
sha512sums=('c3bf7db6e7a25e24c0cb38b9c4fc8926ba3f342301e72368e56189810700d9b987c460d1db0dcea928ce42aa7bfc8827e5e3837bb3921e8fefff250febbfd09f')
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
    mv "NanoVault-1.2.1-x86_64.AppImage" 'nano-vault.AppImage'
	install -Dpm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"
#	install -d "${pkgdir}/usr/bin"
#	ln -s "../../opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/${pkgname}"
}
