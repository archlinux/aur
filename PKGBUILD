# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=mint-y-theme
pkgver=1.2.3
pkgrel=1
pkgdesc="Linux Mint 18 theme"
arch=('any')
url="https://github.com/linuxmint/mint-y-theme"
license=('GPL3')
depends=('gtk-engine-murrine')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.xz::http://packages.linuxmint.com/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('afc3176a0b272460c6bff201249604516df64a1eef87d2a3c49816992104dcf0')

package() {
	cp -ar --no-preserve=ownership "${srcdir}/${pkgname}"/usr "${pkgdir}"
	
	find "$pkgdir" -type d -exec chmod 755 '{}' \;
	find "$pkgdir" -type f -exec chmod 644 '{}' \;
	find "${pkgdir}"/usr/share/themes -type f -name "metacity*xml" -exec sed -i 's:normal_dialog_style_set:normal_style_set:' {} \;
}
