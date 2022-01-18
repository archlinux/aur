# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=fluent-gtk-theme
pkgver=2022.01.15
pkgrel=1
pkgdesc='Fluent design GTK theme'
arch=(any)
url=https://github.com/vinceliuice/Fluent-gtk-theme
license=(GPL3)
options=('!strip')
makedepends=(gnome-shell)
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'fluent-icon-theme: Matching icon theme'
			'fluent-cursor-theme: Matching cursor theme')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver//./-}.tar.gz")
b2sums=('c2224c1a5d36d2be2183c89a5a67ef574d8348050e83eb0381d835d78fce934024b8eb10b6f063e260828d98856b834b21f77150d85a6e569e4a0455bb640e0b')

package () {
	cd "Fluent-gtk-theme-${pkgver//./-}"

	install -m755 -d "${pkgdir}/usr/share/themes"
	./install.sh -i simple -t all -d "${pkgdir}/usr/share/themes"
	./install.sh -i simple -t all --tweaks round float -d "${pkgdir}/usr/share/themes"
}
