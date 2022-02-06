# Maintainer: Agampreet
# Contributor: Agampreet
pkgname=ms-office-electron-bin
pkgver=0.4.5
pkgrel=1
pkgdesc="An Unofficial Microsoft Office Online Desktop Client. Free of Cost."
arch=('x86_64')
url="https://github.com/agam778/MS-Office-Electron"
license=('MIT')
depends=('at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'util-linux-libs' 'xdg-utils')
provides=("ms-office-electron" "MS-Office-Electron")
conflicts=("ms-office-electron-git")
source=("${url}/releases/download/v${pkgver}/MS-Office-Electron-Setup-v${pkgver}-linux-amd64.deb")
sha512sums=('SKIP')

package() {
    bsdtar -xf "${srcdir}/MS-Office-Electron-Setup-${pkgver}-linux-amd64.deb" -C "${srcdir}" --include data.tar.bz2
    bsdtar -xf ${srcdir}/data.tar.bz2 -C ${pkgdir}
	install -d ${pkgdir}/usr/bin/
	ln -s /opt/MS-Office-Electron/MS-Office-Electron ${pkgdir}/usr/bin/MS-Office-Electron
	install -Dm 644 "${pkgdir}/usr/share/icons/hicolor/0x0/apps/MS-Office-Electron.png"  "${pkgdir}/usr/share/pixmaps/MS-Office-Electron.png"
	rm -rfv "${pkgdir}/usr/share/icons/hicolor"
}
