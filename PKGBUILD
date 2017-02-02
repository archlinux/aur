# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=mint-y-theme
pkgver=1.1.5
pkgrel=1
pkgdesc="New theme from LinuxMint 18"
arch=('any')
url="https://github.com/linuxmint/mint-y-theme"
license=('GPL3')
depends=('gtk-engine-murrine')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.xz::http://packages.linuxmint.com/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('f937828463b9e0560d1c2b9bcb55b52fd9b91a296f7457b213f9163f6c5e2aa9')

package() {
	cp -ar --no-preserve=ownership "${srcdir}/${pkgname}"/usr "${pkgdir}"
	
	find "$pkgdir" -type d -exec chmod 755 '{}' \;
	find "$pkgdir" -type f -exec chmod 644 '{}' \;
	find "${pkgdir}"/usr/share/themes -type f -name "metacity*xml" -exec sed -i 's:normal_dialog_style_set:normal_style_set:' {} \;
}
