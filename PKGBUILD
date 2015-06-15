# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_themename=urbanlifestyle
pkgname=sddm-${_themename}-theme
pkgver=0.1.5
pkgrel=1
pkgdesc='A simple and colorful SDDM theme.'
arch=('any')
url='https://github.com/AlfredoRamos/sddm-urbanlifestyle-theme'
license=('GPL3')

depends=('sddm')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")

install=${pkgname}.install

source=(
	"${_themename}-${pkgver}.tar.gz::https://github.com/AlfredoRamos/${pkgname}/archive/${pkgver}.tar.gz"
	"${pkgname}.install"
)
sha512sums=(
	'8984d35d8cfe6eee0b09612bc5d80e048d9560ea386966efceea6b67b1ece442233c379d5740e2b8c00be01002be856142e0dbd7b04c1d31527902a493fdefa3'
	'5b2fdb21db351c6aeb0d36ff74f54f217d50ee19bc60505fad547f7567ba1837569fbcff58a65d52d8097c6456825f42a05580f41369349a69f1baae06483bd9'
)

package() {
	# Installing theme
	cd ${srcdir}/${pkgname}-${pkgver}
	msg2 "Installing theme..."
	mkdir -p ${pkgdir}/usr/share/sddm/themes
	cp -R ./${_themename} ${pkgdir}/usr/share/sddm/themes
}