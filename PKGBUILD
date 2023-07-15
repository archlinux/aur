# Maintainer: Dmali <dmali@vk.com>

pkgname=klaus-bin
pkgver=6.3
_releasedate=2023-07-15
pkgrel=1
pkgdesc="Arch manager that allows you to download, install, delete packages..."
arch=('x86_64')
url="https://github.com/dmaliog/kLausqt/"
license=('GPL 2.0')
groups=()
depends=('qt6-base' 'qt6-multimedia' 'qt6-webengine' 'yay' 'zenity' 'libnotify' 'zip' 'tar')
optdepends=('ocs-url')
source=(
	"${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/klaus-${pkgver}-${_releasedate}-linux64.zip"
)

sha256sums=(
	'2ee6c85e0cbd9b3193e1b0d98d69370e4de066ddcb96e38b0fe6ac48471d90f2'
)

package() {
    mkdir -p ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/128x128/apps/

    install -Dm755 ./klaus/klauspro ${pkgdir}/usr/bin/klauspro

	install -Dt ${pkgdir}/usr/share/applications/ -m644 ./klaus/klaus.desktop
	install -Dt ${pkgdir}/usr/share/icons/hicolor/128x128/apps/ -m644 ./klaus/klaus.png
}
