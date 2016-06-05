# Maintainer: Pablo Lezaeta <prflr88 (arro'a) gmail (puntocom)>

pkgname=firefox-mega
pkgver=2.0.228
pkgrel=1
groups=("firefox-addons")
pkgdesc="MEGA add-on for Firefox, allow better suport for MEGA downloads"
arch=("any")
url="http://mega.co.nz"
license=("BSD")
groups=("firefox-addons")
source=("https://mega.co.nz/mega.xpi")

package(){
	depends=("firefox")

	cd "${srcdir}"
	emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
	local dstdir="${pkgdir}/usr/lib/firefox/browser/extensions/${emid}"
	install -d "${dstdir}"
	cp -dpr --no-preserve=ownership * "${dstdir}"
	rm -r "${dstdir}"/*.xpi
	find "${pkgdir}" -type d -exec chmod 0755 {} \;
	find "${pkgdir}" -type f -exec chmod 0644 {} \;
}
md5sums=('249ade557ad77da9bc1c97284ed359dc')
