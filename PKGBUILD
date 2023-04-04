# Maintainer: Malacology <guoyizhang at malacology dot net>
# Contributor: Malacology <guoyizhang at malacology dot net>

pkgname=mega
_pkgname=mega
pkgver=11.0.13
pkgrel=3
pkgdesc="Molecular Evolutionary Genetics Analysis. https://doi.org/10.1093/molbev/msy096"
arch=('x86_64')
url="https://megasoftware.net"
license=('custom')
depends=(
	'desktop-file-utils'
	'gconf'
	'gtk2'
	'hicolor-icon-theme'
)
source=("https://www.megasoftware.net/releases/mega_$pkgver-1_amd64.deb")
sha256sums=('c86684c5fc24bfdc69c7f8cc84e9a9fc5d1e82465356e7e041eb939ebd28ecdd')

package() {
	tar -p -xf data.tar.xz -C "${pkgdir}"
	chmod 755 -R ${pkgdir}/usr
	cp -r ${pkgdir}/usr/local/* ${pkgdir}/usr/
	rm -r ${pkgdir}/usr/local
	sed -i "s/Exec=mega/Exec=mega %U/g" $pkgdir/usr/share/applications/mega.desktop
}
