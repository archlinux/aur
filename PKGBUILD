# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=mint-y-theme
pkgver=1.2.1
pkgrel=1
pkgdesc="Linux Mint 18 theme"
arch=('any')
url="https://github.com/linuxmint/mint-y-theme"
license=('GPL3')
depends=('gtk-engine-murrine')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.xz::http://packages.linuxmint.com/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('aaf7dc2067282e7e3a37b2d148cf6ddf4bc5531a9524f5ac99870d3c7837a36d')

package() {
	cp -ar --no-preserve=ownership "${srcdir}/${pkgname}"/usr "${pkgdir}"
	
	find "$pkgdir" -type d -exec chmod 755 '{}' \;
	find "$pkgdir" -type f -exec chmod 644 '{}' \;
	find "${pkgdir}"/usr/share/themes -type f -name "metacity*xml" -exec sed -i 's:normal_dialog_style_set:normal_style_set:' {} \;
}
