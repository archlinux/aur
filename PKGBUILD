# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=fluent-gtk-theme
pkgver=2025.04.17
pkgrel=1
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
b2sums=('a18bd8477a0615c3b173282d28a7feb17521aeb63503ab3a4cefd6cd1f72bb3852e11165113967ec44fa7849d478a8731163ea56814eedf3af1fdf1e544dc9a9')

package () {
	cd "Fluent-gtk-theme-${pkgver//./-}"

	install -m755 -d "${pkgdir}/usr/share/themes"
	./install.sh -i simple -t all -d "${pkgdir}/usr/share/themes"
	./install.sh -i simple -t all --tweaks round -d "${pkgdir}/usr/share/themes"
}
