# Maintainer: Shohei Maruyama<cheat.sc.linux@outlook.com>

pkgname=(otto-kde-git kvantum-theme-otto-git)
pkgver=0
pkgrel=1
pkgdesc="Complete Adapta theme pack for KDE Plasma using Kvantum theme engine (git version)"
arch=('any')
url="https://www.opencode.net/jomada/otto"
license=('GPL3')
depends=()
makedepends=()
conflicts=()
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	echo 0
}

package_otto-kde-git() {
	optdepends=(
		'konsole: For the Konsole color scheme'
		'kvantum-theme-otto-git: Otto theme for kvantum (recommended)'
	)

	cd otto
	install -d "${pkgdir}/usr/share"
	install -d "${pkgdir}/usr/share/plasma"
	install -d "${pkgdir}/usr/share/plasma/desktoptheme"

	cp -r look-and-feel "${pkgdir}/usr/share/plasma"
	cp -r Otto "${pkgdir}/usr/share/plasma/desktoptheme"
	cp -r color-schemes "${pkgdir}/usr/share"
	cp -r konsole "${pkgdir}/usr/share"
}

package_kvantum-theme-otto-git() {
	pkgdesc="Otto theme for kvantum"
	depends=(kvantum-qt5)

	cd otto
	install -d "${pkgdir}/usr/share"

	cp -r kvantum "${pkgdir}/usr/share/Kvantum"
}
