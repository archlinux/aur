# Maintainer: Rob Lynn <rob22uk at gmail dot com>
# Contributor: Pablo Lezaeta <prflr88 (arro'a) gmail (puntocom)>

pkgname=firefox-mega
pkgver=3.4.29
pkgrel=1
groups=("firefox-addons")
pkgdesc="MEGA extension for Firefox; enables better support for 
mega.co.nz 
downloads"
arch=("any")
url="http://mega.co.nz"
license=("BSD")
groups=("firefox-addons")
source=("https://mega.nz/meganz.xpi")

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
md5sums=('a786f1634d797ae8d3bddbf1541f32e7')
