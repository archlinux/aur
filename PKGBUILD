# Maintainer: Dmali <dmali@vk.com>

pkgname=klaus-bin
pkgver=18.9
_releasedate=2024-10-23
pkgrel=1
pkgdesc="Arch manager that allows you to download, install, delete packages..."
arch=('x86_64')
url="https://github.com/dmaliog/kLausqt/"
license=('GPL 3.0')
groups=()
depends=('qt6-base>=6.8.0' 'qt6-multimedia>=6.8.0' 'qt6-webengine>=6.8.0' 'qt6-svg>=6.8.0' 'translate-shell' 'yay>=12.4.2' 'zenity' 'libnotify' 'zip' 'tar' 'papirus-icon-theme')
optdepends=('ocs-url')
source=(
	"${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/klaus-${pkgver}-${_releasedate}-linux64.zip"
)

sha256sums=(
	'2bf953045b4d57c84cbae99556d1be64ad7d061bcf632c303ad3697a6611c8c1'
)

package() {
    mkdir -p ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/128x128/apps/

    install -Dm755 ./klaus/kLausPro ${pkgdir}/usr/bin/kLausPro

	install -Dt ${pkgdir}/usr/share/applications/ -m644 ./klaus/klaus.desktop
	install -Dt ${pkgdir}/usr/share/icons/hicolor/128x128/apps/ -m644 ./klaus/klaus.png
}
