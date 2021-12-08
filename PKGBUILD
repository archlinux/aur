# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=fluent-gtk-theme
pkgver=2021.11.23
pkgrel=1
pkgdesc='Fluent design GTK theme'
arch=(any)
url=https://github.com/vinceliuice/Fluent-gtk-theme
license=(GPL3)
options=('!strip')
conflicts=("${pkgname}-git")
makedepends=(gnome-shell)
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'fluent-icon-theme: Matching icon theme'
			'fluent-cursor-theme: Matching cursor theme')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver//./-}.tar.gz")
b2sums=('e5a4a6f251370116b8134795c44c8f00121a59bf41d6ac17d19c0fa98ee1097341299d15976e128b56e42c88c60087749c4002f15306ac01c04d21f6fec8f1ea')

package () {
	cd "Fluent-gtk-theme-${pkgver//./-}"

	install -m755 -d "${pkgdir}/usr/share/themes"
	./install.sh -i simple -t all -d "${pkgdir}/usr/share/themes"
	./install.sh -i simple -t all --tweaks round float -d "${pkgdir}/usr/share/themes"
}
