# $Id$
# Maintainer: archlinuxauruser <archlinuxauruser at messagebox dot email>
# Maintainer: Alireza Ayinmehr <alireza.darksun@gmail.com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=leaflet
pkgver=1.9.4
pkgrel=3
pkgdesc='A JavaScript library for mobile-friendly interactive maps.'
arch=(any)
url="https://github.com/${pkgname^}/${pkgname^}"

license=('BSD')
provides=("${pkgname}")
conflicts=("${pkgname}")
makedepends=(
	'npm'
)
source=("${pkgname}-${pkgver}-LICENSE::${url/github/raw.githubusercontent}/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

b2sums=('f530831c19a88f78090584302071026351668753fdadd6b8e6420f0792dad3122fa772969ad54ba10b85cc24759477666e88f5437872d9ab95aa23729b2d649d')
b2sums_x86_64=('38513f050d6370da41740ecfaf83827008093db8c93eefb80ba9f2997b242d6436d49180ef5f1ae63b4146c76a59901f3470d93c155251211841d05f9b27b5da')

package() {
	echo -e "PWD:$(pwd)"
	echo -e "srcdir:${srcdir}"
	# cd "${pkgname}-${pkgver}"

	install -d ${pkgdir}/usr/share/javascript/${pkgname}
	cp -a ${srcdir}/${pkgname^}-${pkgver}/dist/* ${pkgdir}/usr/share/javascript/$pkgname/

	# Install licence file
	install -Dvm644 -T "${pkgname^}-${pkgver}/LICENSE" ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
