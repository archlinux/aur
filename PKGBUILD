# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=mega
_pkgname=mega
pkgver=11.0.11
pkgrel=1
pkgdesc="Molecular Evolutionary Genetics Analysis. https://doi.org/10.1093/molbev/msy096"
arch=('x86_64')
url="https://megasoftware.net"
license=('custom')
depends=(
	'desktop-file-utils'
	'gconf'
	'gtk2>=2.0'
	'hicolor-icon-theme'
)
source=("https://www.megasoftware.net/releases/mega_$pkgver-1_amd64.deb")
sha256sums=('1077a28d9d910f576f76370a6e796f83de0b87088beceff8c4a501572ff146a8')

package() {
	tar -p -xf data.tar.xz -C "${pkgdir}"
	chmod 755 -R ../pkg/${pkgname}/usr
	cp -r ../pkg/${pkgname}/usr/local/* ../pkg/${pkgname}/usr/
	rm -r ../pkg/${pkgname}/usr/local 
}
