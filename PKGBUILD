# Maintainers: noctulus <fangyuhao0612@gmail.com>
# Contributor: Cyc_developer <cycbot[at]outlook.jp>
pkgname="cyc-desktop-bin"
_pkgname="cyc-desktop"
pkgver=1.0.8
pkgrel=1
pkgdesc="次元城动漫桌面端"
arch=('x86_64')
url="https://www.cyc-anime.net"
license=('MIT')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3')
conflicts=('cycdm-bin')
source=(
	"https://r2.cycback.org/Linux/${_pkgname}-${pkgver}.pacman"
)
md5sums=('917da2496466df2c13525d527c5661f2')

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    cp -r opt/${_pkgname}/* "${pkgdir}/opt/${_pkgname}"
    mkdir -p "${pkgdir}"/usr/bin
    ln -sf /opt/${_pkgname}/cyc-desktop "${pkgdir}"/usr/bin/cyc-desktop
    install -Dm 644 usr/share/icons/hicolor/256x256/apps/cyc-desktop.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/cyc-desktop.png
    install -Dm 644 usr/share/applications/cyc-desktop.desktop "${pkgdir}"/usr/share/applications/cyc-desktop.desktop
}
