# Maintainers: Cyc_developer <cycbot[at]outlook.jp>
pkgname="cyc-desktop-bin"
_pkgname="cyc-desktop"
pkgver=1.0.6
pkgrel=1
pkgdesc="次元城动漫桌面端"
arch=('x86_64')
url="https://www.cycdm01.top"
license=('MIT')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3')
source=(
	"https://github.com/CycityTeam/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.pacman"
)
md5sums=('93a3d623dfdb0a0fc46164d944aa9289')

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    cp -r opt/${_pkgname}/* "${pkgdir}/opt/${_pkgname}"
    mkdir -p "${pkgdir}"/usr/bin
    ln -sf /opt/${_pkgname}/cyc-desktop "${pkgdir}"/usr/bin/cyc-desktop
    install -Dm 644 usr/share/icons/hicolor/256x256/apps/cyc-desktop.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/cyc-desktop.png
    install -Dm 644 usr/share/applications/cyc-desktop.desktop "${pkgdir}"/usr/share/applications/cyc-desktop.desktop
}
