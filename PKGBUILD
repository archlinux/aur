# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_themename=urbanlifestyle
pkgname=sddm-${_themename}-theme
pkgver=0.1.6
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
	'11da8fcfb22fbd5eb48f8b90cd546257034ae7c3eb13866c1d8da0b4a5653e01f5a8a80dea1c2c3d876218696c406699be16353dbbffb045c07047770fc25bd7'
	'5b2fdb21db351c6aeb0d36ff74f54f217d50ee19bc60505fad547f7567ba1837569fbcff58a65d52d8097c6456825f42a05580f41369349a69f1baae06483bd9'
)

package() {
	msg2 "Installing theme..."
	cd ${srcdir}/${pkgname}-${pkgver}
	mkdir -p ${pkgdir}/usr/share/sddm/themes
	cp -R ./${_themename} ${pkgdir}/usr/share/sddm/themes
}