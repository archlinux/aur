# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Esclapion <esclapion at gmail dot com>

_iconset=Plataro
pkgname=${_iconset,,}-icons
pkgver=20161031
pkgrel=1
pkgdesc='An icon theme with emphasis on clarity, colorfulness and flatness'
arch=('any')
url='https://store.kde.org/content/show.php?content=171350'
license=('CCPL:cc-by-nc-sa-4.0')

provides=("${pkgname}=${pkgver}")

source=(
	"https://dl.opendesktop.org/api/files/download/id/1477932347/${_iconset}-${pkgver}.tar.xz"
)
sha512sums=(
	'40d5f15571b440bb829063bbe893d42cd2810c1ac8123338afcb7e860c3b882291731794496da5e8107be840210220e77812c1dcb22432615fdffbe8b9916211'
)

package() {
	# Install package
	mkdir -p "${pkgdir}"/usr/share/icons/
	cp -a "${srcdir}"/Plataro "${pkgdir}"/usr/share/icons
	rm -f "${pkgdir}"/usr/share/icons/${_iconset}/{AUTHORS,COPYING,INSTALL}

	# Install license
	mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
	cp -a "${srcdir}"/Plataro/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
