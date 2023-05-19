# Maintainer: Dmali <dmali@vk.com>

pkgname=klaus-bin
pkgver=1.1
_releasedate=2023-05-19
pkgrel=1
pkgdesc="Arch manager that allows you to download, install, delete packages..."
arch=('x86_64')
url="https://github.com/dmaliog/kLausqt/"
license=('GPL 2.0')
groups=()
depends=('qt5-base' 'qt5-multimedia' 'qt5-webengine' 'qt5-xmlpatterns' 'yay' 'zenity' 'libnotify' 'konsole' 'neofetch')

source=(
	"${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/klaus-${pkgver}-${_releasedate}-linux64.zip"
)

sha256sums=(
	'd146f688d97e05021a8a98bd2cba763dc88bc2aa54d9f7f6ee445f210e14e09c'
)

package() {
    mkdir -p ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/128x128/apps/

    install -Dm755 ./klaus/klauspro ${pkgdir}/usr/bin/klauspro

	install -Dt ${pkgdir}/usr/share/applications/ -m644 ./klaus/klaus.desktop
	install -Dt ${pkgdir}/usr/share/icons/hicolor/128x128/apps/ -m644 ./klaus/klaus.png
}
