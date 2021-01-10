# Maintainer: agilob <archlinux@agilob.net>
pkgname=nault-bin
pkgver=1.8.9
pkgrel=2
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
sha512sums=('98304514ae05d4db369986cd45770e73fe5bf613955780c12c10d2752c5454e5c20613f3374b768fe50658f3a8abee3377e3e30502fe03f17756d9a90d56d19b')
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
