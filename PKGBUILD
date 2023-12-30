# Maintainer: Alfredo Ramos <alfredo.ramos@skiff.com>

_themename=urbanlifestyle
pkgname=${_themename}-sddm-theme
pkgver=0.4.3
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
	'4be8cf3bf95f531e0975eeb765748e0824cb4064b391283b5d50e850d0be9e6a56a19cf188646962bee58e078c5a24fa9315d20a915c3bbd889e7137d20c105c'
)

package() {
	# Installing theme
	mkdir -p "${pkgdir}"/usr/share/sddm/themes/
	cp -R "${srcdir}"/${pkgname}-${pkgver}/ "${pkgdir}"/usr/share/sddm/themes/${_themename}/
}
