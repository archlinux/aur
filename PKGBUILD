# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_themename=urbanlifestyle
pkgname=${_themename}-sddm-theme
pkgver=0.4.2
pkgrel=1
pkgdesc='A simple and colorful SDDM theme'
arch=('any')
url='https://github.com/AlfredoRamos/urbanlifestyle-sddm-theme'
license=('GPL3')

optdepends=('sddm: to use this theme')
provides=("${pkgname}=${pkgver}")
conflicts=("sddm-${_themename}-theme")
replaces=("sddm-${_themename}-theme")

install=${pkgname}.install

source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/AlfredoRamos/${pkgname}/archive/${pkgver}.tar.gz"
)

sha512sums=(
	'857bf7b5d86e760c8f322c0c5f82cdf0e9d3d862cb1ab62b1655c5c82666d1db956e86b81c12cf06b2c4aa45bc3ee8a84dfe72be36eab9478599883589ec08b3'
)

package() {
	# Installing theme
	mkdir -p "${pkgdir}"/usr/share/sddm/themes/
	cp -R "${srcdir}"/${pkgname}-${pkgver}/ "${pkgdir}"/usr/share/sddm/themes/${_themename}/
}
