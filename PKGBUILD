# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=mega
_pkgname=mega
pkgver=11.0.13
pkgrel=2
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
sha256sums=('c86684c5fc24bfdc69c7f8cc84e9a9fc5d1e82465356e7e041eb939ebd28ecdd')

package() {
	tar -p -xf data.tar.xz -C "${pkgdir}"
	chmod 755 -R ../pkg/${pkgname}/usr
	cp -r ../pkg/${pkgname}/usr/local/* ../pkg/${pkgname}/usr/
	rm -r ../pkg/${pkgname}/usr/local
}
