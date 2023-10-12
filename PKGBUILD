# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=fluent-gtk-theme
pkgver=2023.06.20
pkgrel=1
pkgdesc='Fluent design GTK theme'
arch=(any)
url=https://github.com/vinceliuice/Fluent-gtk-theme
license=(GPL3)
options=('!strip')
makedepends=()
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'fluent-icon-theme: Matching icon theme'
			'fluent-cursor-theme: Matching cursor theme')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver//./-}.tar.gz")
b2sums=('62aa4b11df165b46ddc25c15274d2d09ac5aec7c598b04cea9fa7f8fc61e773e303f86a57e69f9e52930f7be6a79ddcb2f2cc1e6c617b795ce58b16eefb04067')

package () {
	cd "Fluent-gtk-theme-${pkgver//./-}"

	install -m755 -d "${pkgdir}/usr/share/themes"
	./install.sh -i simple -t all -d "${pkgdir}/usr/share/themes"
	./install.sh -i simple -t all --tweaks round float -d "${pkgdir}/usr/share/themes"
}
