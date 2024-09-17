# Maintainer: Dmali <dmali@vk.com>

pkgname=klaus-bin
pkgver=15.4
_releasedate=2024-09-18
pkgrel=1
pkgdesc="Arch manager that allows you to download, install, delete packages..."
arch=('x86_64')
url="https://github.com/dmaliog/kLausqt/"
license=('GPL 3.0')
groups=()
depends=('qt6-base>=6.7.2' 'qt6-multimedia>=6.7.2' 'qt6-webengine>=6.7.2' 'qt6-svg>=6.7.2' 'translate-shell' 'yay>=12.3.5' 'zenity' 'libnotify' 'zip' 'tar' 'papirus-icon-theme')
optdepends=('ocs-url')
source=(
	"${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/klaus-${pkgver}-${_releasedate}-linux64.zip"
)

sha256sums=(
	'1888cc8bcfb9c4701b52d0a53dd5a7ab2cbb83568679df198d38e0e122d58da5'
)

package() {
    mkdir -p ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/128x128/apps/

    install -Dm755 ./klaus/kLausPro ${pkgdir}/usr/bin/kLausPro

	install -Dt ${pkgdir}/usr/share/applications/ -m644 ./klaus/klaus.desktop
	install -Dt ${pkgdir}/usr/share/icons/hicolor/128x128/apps/ -m644 ./klaus/klaus.png
}
