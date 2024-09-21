# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=fluent-gtk-theme
pkgver=2024.06.12
pkgrel=3
pkgdesc='Fluent design GTK theme'
arch=(any)
url=https://github.com/vinceliuice/Fluent-gtk-theme
license=(GPL-3.0-or-later)
options=('!strip' '!debug')
makedepends=()
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'fluent-icon-theme: Matching icon theme'
			'fluent-cursor-theme: Matching cursor theme')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver//./-}.tar.gz")
b2sums=('03dc7baf28268fc15981a1d95843e890ec561a2a6a50b3684e5b0eb675302ea5c34aab1c3b44258a9292f50fd50171eaac33570d7f2dbf6e3b220d6f80222d7d')

package () {
	cd "Fluent-gtk-theme-${pkgver//./-}"

	install -m755 -d "${pkgdir}/usr/share/themes"
	./install.sh -i simple -t all -d "${pkgdir}/usr/share/themes"
	./install.sh -i simple -t all --tweaks round -d "${pkgdir}/usr/share/themes"
}
