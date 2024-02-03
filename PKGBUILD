# Maintainer: Dmali <dmali@vk.com>

pkgname=klaus-bin
pkgver=12.4
_releasedate=2024-02-04
pkgrel=1
pkgdesc="Arch manager that allows you to download, install, delete packages..."
arch=('x86_64')
url="https://github.com/dmaliog/kLausqt/"
license=('GPL 3.0')
groups=()
depends=('qt6-base>=6.6.1' 'qt6-multimedia>=6.6.1' 'qt6-webengine>=6.6.1' 'qt6-svg' 'translate-shell' 'yay>=12.2.0' 'zenity' 'libnotify' 'zip' 'tar' 'papirus-icon-theme')
optdepends=('ocs-url')
source=(
	"${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/klaus-${pkgver}-${_releasedate}-linux64.zip"
)

sha256sums=(
	'61cfad2c1d88289e1d8180a1a5d4b82d43cfbd3aac21a997cd1d25c945b15ccd'
)

package() {
    mkdir -p ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/128x128/apps/

    install -Dm755 ./klaus/klauspro ${pkgdir}/usr/bin/klauspro

	install -Dt ${pkgdir}/usr/share/applications/ -m644 ./klaus/klaus.desktop
	install -Dt ${pkgdir}/usr/share/icons/hicolor/128x128/apps/ -m644 ./klaus/klaus.png
}
