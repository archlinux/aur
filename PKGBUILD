# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=xfwm4-themes-curvish
pkgver=0.0.3
pkgrel=3
pkgdesc="Popular 'Curve' window decorations, modified to support theme colors"
arch=('any')
depends=('xfwm4')
url='http://www.eworm.de/'
license=('GPL')
source=("http://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('9dd7db51c13728588079653d37072d70abeb4121a6470074aa73637dec6d800d')

package() {
	cd "${srcdir}"
	for FILE in $(find CurvishDark/ -type f); do
		install -D -m0644 ${FILE} ${pkgdir}/usr/share/themes/${FILE}
	done
	for FILE in $(find Curvish/ -type f); do
		install -D -m0644 ${FILE} ${pkgdir}/usr/share/themes/${FILE}
		[ -f ${pkgdir}/usr/share/themes/CurvishDark/xfwm4/${FILE##*/} ] || ln -s ../../${FILE} ${pkgdir}/usr/share/themes/CurvishDark/xfwm4/${FILE##*/}
	done
}

