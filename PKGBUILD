# Maintainer: syrupderg <syrupderg at proton dot me>

_pkgname=klassy
pkgname=klassy-bin
pkgver=6.7.1
pkgrel=1
pkgdesc="Highly customizable binary Window Decoration, Application Style and Global Theme plugin for recent versions of the KDE Plasma desktop."
arch=('x86_64')
url="https://github.com/paulmcauley/klassy"
license=('GPL-2.0-only AND GPL-3.0-only AND GPL-2.0-or-later AND LGPL-2.1-or-later AND MIT')

depends=(
	frameworkintegration
	frameworkintegration5
	gcc-libs
	glibc
	hicolor-icon-theme
	kcmutils
	kcolorscheme
	kconfig
	kconfig5
	kconfigwidgets5
	kcoreaddons
	kdecoration
	kguiaddons
	kguiaddons5
	ki18n
	kiconthemes
	kiconthemes5
	kirigami
	kwidgetsaddons
	kwindowsystem
	kwindowsystem5
	qt5-base
	qt5-declarative
	qt6-base
	qt6-declarative
	qt6-svg
	xdg-utils
)

provides=('klassy')
conflicts=('klassy')
replaces=('classik')

source=(
	"https://download.opensuse.org/repositories/home:/paulmcauley/Arch/$CARCH/${_pkgname}-${pkgver}-${pkgrel}-$CARCH.pkg.tar.zst"
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/paulmcauley/klassy/v${pkgver}/LICENSES/MIT.txt"
)
sha256sums=(
	'SKIP'
	'SKIP'
)

options=(!debug)

package() {
	cp -a "${srcdir}/usr" "${pkgdir}/"

	# Install MIT license to required directory
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
