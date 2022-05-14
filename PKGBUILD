# Maintainer: Agampreet
# Contributor: Agampreet
pkgname=ms-office-electron-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="An Unofficial Microsoft Office Online Desktop Client. Free of Cost."
arch=('x86_64')
url="https://github.com/agam778/MS-Office-Electron"
license=('MIT')
depends=('libxcrypt-compat' 'at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'util-linux-libs' 'xdg-utils')
provides=("ms-office-electron" "MS-Office-Electron")
conflicts=("ms-office-electron-git")
source=("${url}/releases/download/v${pkgver}/MS-Office-Electron-Setup-v${pkgver}-linux-amd64.deb")
sha512sums=('SKIP')

package() {
	bsdtar -xf "${srcdir}/MS-Office-Electron-Setup-v${pkgver}-linux-amd64.deb" -C "${srcdir}" --include data.tar.xz
    bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}
    install -d ${pkgdir}/usr/bin/
    ln -s /opt/MS-Office-Electron/ms-office-electron ${pkgdir}/usr/bin/ms-office-electron
}
