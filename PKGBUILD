# Maintainer: Alfredo Ramos <alfredo.ramos@proton.me>

_themename=urbanlifestyle
pkgname=${_themename}-sddm-theme
pkgver=0.4.4
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
	'c4eae4d9694647da6cfdce97696526f3c0d09b97dd52d03475426567d86aaf59b83d203d54d4f056335bd2555ada97280ef3c177199a25c15f1bfdb041b6bd61'
)

package() {
	# Installing theme
	mkdir -p "${pkgdir}"/usr/share/sddm/themes/
	cp -R "${srcdir}"/${pkgname}-${pkgver}/ "${pkgdir}"/usr/share/sddm/themes/${_themename}/
}
