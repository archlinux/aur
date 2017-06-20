# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=mint-y-theme
pkgver=1.1.8
pkgrel=1
pkgdesc="Linux Mint 18 theme"
arch=('any')
url="https://github.com/linuxmint/mint-y-theme"
license=('GPL3')
depends=('gtk-engine-murrine')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.xz::http://packages.linuxmint.com/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('afe4887cadcff3d0841a662c7025fe3e8264b5fa20b72b938ab8f2c2e9673f23')

package() {
	cp -ar --no-preserve=ownership "${srcdir}/${pkgname}"/usr "${pkgdir}"
	
	find "$pkgdir" -type d -exec chmod 755 '{}' \;
	find "$pkgdir" -type f -exec chmod 644 '{}' \;
	find "${pkgdir}"/usr/share/themes -type f -name "metacity*xml" -exec sed -i 's:normal_dialog_style_set:normal_style_set:' {} \;
}
