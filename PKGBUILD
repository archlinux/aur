# Maintainer: Agampreet
# Contributor: Agampreet
pkgname=ms-365-electron-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Unofficial Microsoft 365 Web Desktop Wrapper made with Electron"
arch=('x86_64')
url="https://github.com/agam778/MS-365-Electron"
license=('MIT')
depends=('libxcrypt-compat' 'at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'util-linux-libs' 'xdg-utils')
provides=("ms-365-electron" "MS-365-Electron")
conflicts=("ms-365-electron-git")
source=("${url}/releases/download/v${pkgver}/MS-365-Electron-v${pkgver}-linux-amd64.deb")
sha512sums=('SKIP')

package() {
    bsdtar -xf "${srcdir}/MS-365-Electron-v${pkgver}-linux-amd64.deb" -C "${srcdir}" --include data.tar.xz
    bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}
    install -d ${pkgdir}/usr/bin/
    ln -s /opt/MS-365-Electron/ms-365-electron ${pkgdir}/usr/bin/ms-365-electron
}
