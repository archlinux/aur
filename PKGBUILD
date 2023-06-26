# Maintainer: Dmali <dmali@vk.com>

pkgname=klaus-bin
pkgver=4.0
_releasedate=2023-06-27
pkgrel=1
pkgdesc="Arch manager that allows you to download, install, delete packages..."
arch=('x86_64')
url="https://github.com/dmaliog/kLausqt/"
license=('GPL 2.0')
groups=()
depends=('qt6-base' 'qt6-multimedia' 'qt6-webengine' 'yay' 'zenity' 'libnotify' 'zip' 'tar')

source=(
	"${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/klaus-${pkgver}-${_releasedate}-linux64.zip"
)

sha256sums=(
	'2b1109a793d57b2a6d56492a8e63708b9c44f6bc3c1b88a42a787f04da1eae75'
)

package() {
    mkdir -p ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/128x128/apps/

    install -Dm755 ./klaus/klauspro ${pkgdir}/usr/bin/klauspro

	install -Dt ${pkgdir}/usr/share/applications/ -m644 ./klaus/klaus.desktop
	install -Dt ${pkgdir}/usr/share/icons/hicolor/128x128/apps/ -m644 ./klaus/klaus.png
}
