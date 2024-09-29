# Maintainer: Dmali <dmali@vk.com>

pkgname=klaus-bin
pkgver=16.2
_releasedate=2024-09-30
pkgrel=1
pkgdesc="Arch manager that allows you to download, install, delete packages..."
arch=('x86_64')
url="https://github.com/dmaliog/kLausqt/"
license=('GPL 3.0')
groups=()
depends=('qt6-base>=6.7.3' 'qt6-multimedia>=6.7.3' 'qt6-webengine>=6.7.3' 'qt6-svg>=6.7.3' 'translate-shell' 'yay>=12.4.2' 'zenity' 'libnotify' 'zip' 'tar' 'papirus-icon-theme')
optdepends=('ocs-url')
source=(
	"${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/klaus-${pkgver}-${_releasedate}-linux64.zip"
)

sha256sums=(
	'320c9f1f4c1e07a150c113313383a7df3f6c53a88b6aa8f7db0000fdd498b867'
)

package() {
    mkdir -p ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/128x128/apps/

    install -Dm755 ./klaus/kLausPro ${pkgdir}/usr/bin/kLausPro

	install -Dt ${pkgdir}/usr/share/applications/ -m644 ./klaus/klaus.desktop
	install -Dt ${pkgdir}/usr/share/icons/hicolor/128x128/apps/ -m644 ./klaus/klaus.png
}
