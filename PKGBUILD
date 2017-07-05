# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_themename=urbanlifestyle
pkgname=${_themename}-sddm-theme
pkgver=0.4.1
pkgrel=1
pkgdesc='A simple and colorful SDDM theme'
arch=('any')
url='https://github.com/AlfredoRamos/urbanlifestyle-sddm-theme'
license=('GPL3')

optdepends=('sddm: to use this theme')
provides=("${pkgname}=${pkgver}")
replaces=("sddm-${_themename}-theme")

install=${pkgname}.install

source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/AlfredoRamos/${pkgname}/archive/${pkgver}.tar.gz"
)

sha512sums=(
	'46a4c00144c71605ebee72f589b00db05243effa801e9920609581e7352249c946e0d9ae54bd13bf27df2125a310c7276ed80a7f331849c102b4ff05f7fedfc4'
)

package() {
	# Installing theme
	cd "${srcdir}"/${pkgname}-${pkgver}
	mkdir -p "${pkgdir}"/usr/share/sddm/themes
	cp -R ${_themename} "${pkgdir}"/usr/share/sddm/themes
}
