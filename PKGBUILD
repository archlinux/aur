# Maintainer: Dmali <dmali@vk.com>

pkgname=klaus-bin
pkgver=4.2
_releasedate=2023-07-01
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
	'79ebd4d82e81d5d3f7d4217dd1a996f34dfe84aaf4f3018e56638a9b12153dd7'
)

package() {
    mkdir -p ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/128x128/apps/

    install -Dm755 ./klaus/klauspro ${pkgdir}/usr/bin/klauspro

	install -Dt ${pkgdir}/usr/share/applications/ -m644 ./klaus/klaus.desktop
	install -Dt ${pkgdir}/usr/share/icons/hicolor/128x128/apps/ -m644 ./klaus/klaus.png
}
