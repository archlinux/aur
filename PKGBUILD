# Maintainer: Dmali <dmali@vk.com>

pkgname=klaus-bin
pkgver=15.2
_releasedate=2024-08-24
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
	'23f41231a886704b907190cf8abfa20a68d23ea470b059476c2fb904b9dbbdaf'
)

package() {
    mkdir -p ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/128x128/apps/

    install -Dm755 ./klaus/kLausPro ${pkgdir}/usr/bin/kLausPro

	install -Dt ${pkgdir}/usr/share/applications/ -m644 ./klaus/klaus.desktop
	install -Dt ${pkgdir}/usr/share/icons/hicolor/128x128/apps/ -m644 ./klaus/klaus.png
}
