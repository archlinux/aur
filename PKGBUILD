# Maintainer: Shohei Maruyama<cheat.sc.linux@outlook.com>

pkgname=(otto-kde-git kvantum-theme-otto-git)
pkgver=r14.fd67d36
pkgrel=2
pkgdesc="Otto Theme for Kde Plasma"
arch=('any')
url="https://www.opencode.net/jomada/otto"
license=('GPL3')
depends=()
makedepends=('git')
conflicts=()
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd otto
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
	depends=(kvantum)

	cd otto
	install -d "${pkgdir}/usr/share"

	cp -r kvantum "${pkgdir}/usr/share/Kvantum"
}
