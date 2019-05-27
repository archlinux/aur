# Maintainer: agilob <archlinux@agilob.net>
pkgname=nano-vault-bin
pkgver=1.1.3
pkgrel=1
pkgdesc='Official Nano Vault AppImage client'
arch=('x86_64')
url='https://github.com/cronoh/nanovault'
#license=('GPL3')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=(!strip)
_appimage="nano-vault.AppImage"
source=("https://github.com/cronoh/nanovault/releases/download/v1.1.3/NanoVault-1.1.3-x86_64.AppImage")
noextract=("${_appimage}")
sha512sums=('d9a594acf29cedcf62a6d95ee1a6ddefa9d65fbd534ff7be915993e036f896fd2aa264bee9fe73be12f5fd5ba6a3da08c88971a9db773a742b9e443d3914be1b')
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
    mv "NanoVault-1.1.3-x86_64.AppImage" 'nano-vault.AppImage'
	install -Dpm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"
#	install -d "${pkgdir}/usr/bin"
#	ln -s "../../opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/${pkgname}"
}
