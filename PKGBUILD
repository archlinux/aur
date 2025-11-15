# $Id$
# Maintainer: archlinuxauruser <archlinuxauruser at messagebox dot email>
# Maintainer: Alireza Ayinmehr <alireza.darksun@gmail.com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=leaflet
pkgver=1.9.4
pkgrel=1
pkgdesc='A JavaScript library for mobile-friendly interactive maps.'
arch=(any)
url="https://github.com/${pkgname}/${pkgname}"

license=('BSD')
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("${pkgname}-${pkgver}-LICENSE::${url/github/raw.githubusercontent.com}/Leaflet/refs/heads/main/LICENSE")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

b2sums=('786a02f742015903c6c6fd852552d272912f4740e15847618a86e217f71f5419d25e1031afee585313896444934eb04b903a685b1448b755d56f701afe9be2ce')
b2sums_x86_64=('38513f050d6370da41740ecfaf83827008093db8c93eefb80ba9f2997b242d6436d49180ef5f1ae63b4146c76a59901f3470d93c155251211841d05f9b27b5da')

package() {
	echo -e "PWD:$(pwd)"
	echo -e "srcdir:${srcdir}"
	# cd "${pkgname}-${pkgver}"

	install -d ${pkgdir}/usr/share/javascript/${pkgname}
	cp -a ${srcdir}/Leaflet-${pkgver}/dist/* ${pkgdir}/usr/share/javascript/$pkgname/
	install -Dvm644 -T "Leaflet-${pkgver}/LICENSE" ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
