# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=fluent-gtk-theme
pkgver=2022.06.15
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
b2sums=('acc5123c840c2dcb7c0f983a7f49daf1fd26705d6d3009b79be0cb140d3066513c6e25263910aadd4a6318919018c97e4af0bbd39cc689354f1436bcd250a17a')

package () {
	cd "Fluent-gtk-theme-${pkgver//./-}"

	install -m755 -d "${pkgdir}/usr/share/themes"
	./install.sh -i simple -t all -d "${pkgdir}/usr/share/themes"
	./install.sh -i simple -t all --tweaks round float -d "${pkgdir}/usr/share/themes"
}
